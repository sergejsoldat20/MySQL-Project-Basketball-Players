package DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

public class ConnectionPool {
    private static final String BUNDLE_NAME = "ConnectionPool";

    private String jdbcURL;
    private String username;
    private String password;
    private int preconnectCount;
    private int maxIdleConnections;
    private int maxConnections;

    private int connectCount;
    private List<Connection> usedConnections;
    private List<Connection> freeConnections;

    private static ConnectionPool instance;

    public static ConnectionPool getInstance() {
        if (instance == null)
            instance = new ConnectionPool();
        return instance;
    }

    /**
     * Private constructor
     */
    private ConnectionPool() {
        readConfiguration();
        try {
            freeConnections = new ArrayList<>();
            usedConnections = new ArrayList<>();

            for (int i = 0; i < preconnectCount; ++i) {
                Connection conn = DriverManager.getConnection(jdbcURL, username, password);
                freeConnections.add(conn);
            }

            connectCount = preconnectCount;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Read configuration file
     */
    private void readConfiguration() {
        ResourceBundle bundle = PropertyResourceBundle.getBundle(BUNDLE_NAME);

        jdbcURL = bundle.getString("jdbcURL");
        username = bundle.getString("username");
        password = bundle.getString("password");
        preconnectCount = 0;
        maxIdleConnections = 10;
        maxConnections = 10;

        try {
            preconnectCount =
                    Integer.parseInt(bundle.getString("preconnectCount"));
            maxIdleConnections =
                    Integer.parseInt(bundle.getString("maxIdleConnections"));
            maxConnections =
                    Integer.parseInt(bundle.getString("maxConnections"));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Check in method
     */
    public synchronized void checkIn(Connection connection) {
        if (connection == null)
            return;

        if (usedConnections.remove(connection)) {
            freeConnections.remove(connection);
            while (freeConnections.size() > maxIdleConnections) {
                int lastOne = freeConnections.size() - 1;
                Connection c = freeConnections.remove(lastOne);
                try {
                    c.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            notify();
        }
    }

    /**
     * Check out method
     */
    public synchronized Connection checkOut() throws SQLException {

        Connection connection = null;

        if (freeConnections.size() > 0) {
            connection = freeConnections.remove(0);
            usedConnections.add(connection);
        } else {
            if (connectCount < maxConnections) {
                connection = DriverManager.getConnection(jdbcURL, username, password);
                usedConnections.add(connection);
                connectCount++;
            } else {
                try {
                    wait();
                    connection = freeConnections.remove(0);
                    usedConnections.add(connection);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
            }
        }

        return connection;
    }
}
