#' @export
createObservationTests <- function () {
  
  if (truvenType == "CCAE")
  {
    
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "SVCDATE is outside of observation_period, measurement record created . Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2013-10-13', bmi = '20.0')
  expect_measurement(person_id = patient$person_id, measurement_source_value = 'BMI', value_as_number = '20.0', measurement_date = '2013-10-13')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "Patient answered 3 for question EXERWEEK, value_as_number=3. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-05-25', exerweek = '3')
  expect_observation(person_id = patient$person_id, observation_source_value = 'EXERWEEK', value_as_number = '3', observation_date = '2012-05-25')
  
  #This will test HIX-1299
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "Patient answered 1 for question FLU_SHOT, drug_exposure record created (HIX-1299). Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-05-25', flu_shot = '1')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '4214838')
  
  }
}
