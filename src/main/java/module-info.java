module com.example.kosarkasidb {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires org.kordamp.bootstrapfx.core;
    requires java.sql;

    opens Model to javafx.base;
    opens Controller to javafx.fxml;
    exports Controller;
}