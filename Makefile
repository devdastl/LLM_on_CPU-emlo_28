IMAGE_NAME = ggml:test
REPO = https://github.com/ggerganov/llama.cpp


build-docker:
	@echo building docker image and installing ggml.cpp
	cd docker && docker build -t ${IMAGE_NAME} . && cd ..

build-local:
	@echo building ggml.cpp locally!

	@echo install required packages:
	sudo apt-get update && sudo apt-get install make git wget build-essential -y
	git clone ${REPO} && cd llama.cpp && make -j && cd ..

get-model:
	@echo downloading model....
	curl -L -O https://huggingface.co/TheBloke/yayi2-30B-llama-GGUF/resolve/main/yayi2-30b-llama.Q2_K.gguf 

run-sample-docker:
	@echo running sample inference using docker...
	docker run -it --rm -v ${PWD}/:/models/ ${IMAGE_NAME} \
	./main -m /models/yayi2-30b-llama.Q2_K.gguf \
	-n 256 \
	--grammar-file /models/grammar/grammar.gbnf \
	-p 'man name Josh has a car from ford company it was launchd on year 1994; josn:'

run-sample-local:
	@echo running a sample inference locally....
	cd llama.cpp && \
	./main -m ../yayi2-30b-llama.Q2_K.gguf \
	-n 100 --grammar-file ../grammar/grammar.gbnf \
	-p 'man name Josh has a car from ford company it was launchd on year 1994; josn:'
	cd ..

deploy-server-docker:
	@echo deploying server on the docker. Open "localhost:8080" on your browser
	docker run -it --rm -p 8080:8080 -v ${PWD}/:/models/ ${IMAGE_NAME} \
	./server -m /models/yayi2-30b-llama.Q2_K.gguf \
	-c 2048 --host 0.0.0.0

deploy-server-local:
	@echo deploying server locally. Open "locahost:8080" on your browser
	cd llama.cpp && ./server -m ../yayi2-30b-llama.Q2_K.gguf \
	-c 300 --host 0.0.0.0