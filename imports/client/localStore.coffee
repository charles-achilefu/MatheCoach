_ = require "lodash"
{ EJSON } = require "meteor/ejson"

localStorageAvailable = ->
  try
    storage = window.localStorage
    x = "__storage_test__"
    storage.setItem x, x
    storage.removeItem x
    true
  catch error
    false

getSubmissions = ->
  if submissionsJSON = window.localStorage.getItem "submissions"
    EJSON.parse submissionsJSON
  else
    []

setSubmissions = (submissions) ->
  submissionsJSON = EJSON.stringify submissions
  window.localStorage.setItem "submissions", submissionsJSON

exports.flushSubmissionStore = ->
  submissions = getSubmissions()
  setSubmissions []
  submissions

exports.pushSubmissionToStore = (submissionObject) ->
  if localStorageAvailable()
    submissions = getSubmissions()
    submissions.push submissionObject
    setSubmissions submissions

exports.removeSubmissionFromStore = (submissionObject) ->
  if localStorageAvailable()
    submissions = getSubmissions()
    _.remove submissions, (e) -> _.isEqual e, submissionObject
    setSubmissions submissions
