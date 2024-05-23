build_runner:
	dart pub run build_runner build

build_runner_delete_conflicting_outputs:
	dart pub run build_runner build --delete-conflicting-outputs

build_runner_clean:
	dart pub run build_runner clean

clean: 
	flutter clean

update_dotenv_vars:
	make build_runner_clean
	make build_runner_delete_conflicting_outputs

setup: 
	flutter pub get
	make update_dotenv_vars