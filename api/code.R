library(plumber)

#* @filter cors
cors <- function(req, res) {

  res$setHeader("Access-Control-Allow-Origin", "*")

  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }

}


#* @param gender
#* @param age 
#* @param hypertension
#* @param heart_disease
#* @param ever_married
#* @param work_type
#* @param Residence_type
#* @param avg_glucose_level
#* @param bmi
#* @param smoking_status

#* @get /heart_stroke
function(gender, age, hypertension, heart_disease, ever_married, work_type, Residence_type, avg_glucose_level, bmi, smoking_status){
  load("model.RData")
  
  
  test = data.frame(gender = as.factor(gender), age = as.numeric(age), hypertension = as.integer(hypertension), heart_disease = as.integer(heart_disease), 
                    ever_married = as.factor(ever_married), work_type = as.factor(work_type), Residence_type = as.factor(Residence_type), 
                    avg_glucose_level = as.numeric(avg_glucose_level), bmi = as.numeric(bmi), smoking_status = as.factor(smoking_status), 
                   ncol =10)
  require(jsonlite)
  toJSON(ifelse(predict(log_both, test, type = "response")>0.5, 1, 0))
}
