from duckdb import duckdb
import pandas as pd


def data_preprocessing():
    data_path = "dataset/archive/amazon.csv"
    read_dat = duckdb.query(f"SELECT * FROM read_csv_auto('{data_path}')")
    filtered_feature = duckdb.sql(f"SELECT Category, ANY_VALUE(Sales), ANY_VALUE(Profit) FROM read_dat group by 1 order by 1")
    duckdb.execute(f"COPY (SELECT * FROM filtered_feature) TO \"dataset/archive/output.csv\" (HEADER, DELIMITER \",\");")

data_preprocessing()
