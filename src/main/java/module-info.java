module com.example.kosarkasidb {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires org.kordamp.bootstrapfx.core;
    requires java.sql;

    opens Model to javafx.base;
    opens com.example.kosarkasidb to javafx.fxml;
    exports com.example.kosarkasidb;
}