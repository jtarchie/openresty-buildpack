# Usage

```sh
$ ls
nginx.conf

$ heroku create -b https://github.com/jtarchie/openresty-buildpack
```

# Run the Tests

The tests on this buildpack are written in Rspec to allow the use of focused: true. Parallelization of testing is provided by https://github.com/grosser/parallel_tests this lib spins up an arbitrary number of processes and running a different test file in each process, it does not parallelize tests within a test file. To run the tests: clone the repo, then bundle install then clone the test fixtures by running:

```sh
$ hatchet install
```

Now run the tests:

```sh
$ bundle exec parallel_rspec -n 6 spec/
```

If you don't want to run them in parallel you can still:

```sh
$ bundle exec rake spec
```

Now go take a nap or something for a really long time.
