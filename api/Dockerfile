FROM rstudio/plumber
COPY . .
RUN R -e "install.packages('plumber')"
CMD ["api.R"]
