from pyspark.sql import SparkSession

def main():
    # Initialisation
    spark = SparkSession.builder \
        .appName("HelloWorld") \
        .getOrCreate()

    # Création d'un un ensemble de données simple
    data = [("Hello",), ("World",)]
    columns = ["message"]
    df = spark.createDataFrame(data, columns)

    # Affichage du contenu de l'ensemble de données
    df.show()

    # Arrêt de la session Spark
    spark.stop()

if __name__ == "__main__":
    main()
