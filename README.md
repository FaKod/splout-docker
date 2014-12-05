#Splout 0.3.0 Docker image

Based on [Apache Hadoop 2.6.0 Docker image](https://github.com/sequenceiq/hadoop-docker).


# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build -t="fakod/splout:3.0-V1.0" .
```


# Start a container

In order to use the Docker image you have just build or pulled use:

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker run -i -t -P fakod/splout:3.0-V1.0 /etc/start.sh -bash
```

## Testing

You can run one of the Splout or Hadoop stock examples:

```
cd $HADOOP_PREFIX
# run the mapreduce
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar grep input output 'dfs[a-z.]+'

# check the output
bin/hdfs dfs -cat output/*

# run the Splout examples
/root/sploutexamples.sh
# check the result in the Splout Query Panel 
# f.e. with 'SELECT * FROM city WHERE country_code = "JPN"' and Partition key 'JPN'
```

