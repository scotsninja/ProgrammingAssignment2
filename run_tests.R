## Run tests using testhat library on 2x2 and 4x4 matrices

library('testthat')

source('cachematrix.R')

test_dir('tests', reporter = 'Summary')
