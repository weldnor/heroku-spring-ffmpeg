FROM openjdk:11
EXPOSE 8080
RUN apt update; apt install ffmpeg -y
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
COPY test.mp4 test.mp4
ENV ffmpeg_ffmpeg_path=/usr/bin/ffmpeg
ENV ffmpeg_ffprobe_path=/usr/bin/ffprobe
ENV ffmpeg_input_directory=/
ENV ffmpeg_output_directory=/
ENTRYPOINT ["java","-jar","/app.jar"]