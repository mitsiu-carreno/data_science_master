podman build -t cluster-apache-spark:3.5.3 .

podman exec -it spark ./bin/spark-shell  --packages org.apache.hadoop:hadoop-aws:3.3.4,com.amazonaws:aws-java-sdk-bundle:1.12.526,org.elasticsearch:elasticsearch-spark-30_2.12:8.6.2 --conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 --conf spark.hadoop.fs.s3a.access.key=minio --conf spark.hadoop.fs.s3a.secret.key=minio123 --conf spark.hadoop.fs.s3a.path.style.access=true --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem --conf spark.es.nodes="es01" --conf spark.es.port="9200" --conf spark.es.nodes.wan.only="true"

val df = spark.read.format("csv").option("header", "true").load("s3a://demo/demo.csv")

df.write.format("es").save("nombre_indice")


http://localhost:9200/nombre_indice/

http://localhost:9200/nombre_indice/_search?q=%22hola%22