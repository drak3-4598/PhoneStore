package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface DAOMultiInterface<K,Z,T> {
    void doSave(T item) throws SQLException;
    boolean doDelete(K key1, Z key2) throws SQLException;
    T doRetrieveByKey(K key1, Z key2) throws SQLException;
    boolean doUpdate(T item) throws SQLException;
    ArrayList<T> doRetrieveAll() throws SQLException;
}
