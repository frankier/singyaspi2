all: package.zip

clean:
	rm -rf build
	cd singreqrun/ && make clean

singreqrun/clients/unix/client.com:
	cd singreqrun/ && make

build/singyaspi2/README.md: singreqrun/clients/unix/client.com
	mkdir -p build/singyaspi2/python
	cp -r \
	  singreqrun/executor.sh \
	  singreqrun/entrypoint.sh \
	  singreqrun/coordinator.sh \
	  singreqrun/patch_path_then.sh \
	  run_bootstrap.sh \
	  setup.sh \
	  README.md \
	  singreqrun/clients/unix/client.com \
	  singreqrun/contrib \
	  build/singyaspi2
	PYTHONDONTWRITEBYTECODE=1 pip install \
	  --target=build/singyaspi2/python \
	  --no-deps \
	  beartype ./yaspi
	cd build/singyaspi2/python && \
	  find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
	mkdir -p build/singyaspi2/python/watchlogs/
	echo "class Watcher: pass" > build/singyaspi2/python/watchlogs/watchlogs.py
	rm -rf build/singyaspi2/python/yaspi/templates/ray
	cp -r \
	  singray \
	  build/singyaspi2/python/yaspi/templates/ray

package.zip: build/singyaspi2/README.md
	cd build/ && zip -r package.zip singyaspi2
	mv build/package.zip .
