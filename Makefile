build_runner:
	flutter pub run build_runner build

build_runner_delete_conflicting_outputs:
	flutter pub run build_runner build --delete-conflicting-outputs

clean: 
	flutter clean

update_dotenv_vars:
	make build_runner_delete_conflicting_outputs

setup: 
	flutter pub get
	make build_runner_delete_conflicting_outputs