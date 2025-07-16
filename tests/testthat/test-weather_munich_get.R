# I don't know what a relevant test would be for this package and since the instructions say nothing
# about testing or error handling I am not going to spend time on it.
# I do know now that it exists and I understand its importance for actual production code.

test_that("object has correct typ",{
  expect_type(weather_munich_get(), type = "list")
})

