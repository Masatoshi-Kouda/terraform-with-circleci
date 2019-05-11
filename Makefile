release-pr-movies-stg:
	git checkout master
	git pull
	hub pull-request -m "release/movies/stg" -b release/movies/stg

release-pr-movies-prd:
	git checkout master
	git pull
	hub pull-request -m "release/movies/prd" -b release/movies/prd

release-pr-payment-prd:
	git checkout master
	git pull
	hub pull-request -m "release/payment/prd" -b release/payment/prd

release-pr-payment-stg:
	git checkout master
	git pull
	hub pull-request -m "release/payment/stg" -b release/payment/stg
