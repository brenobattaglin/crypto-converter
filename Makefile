build_runner:
	dart pub run build_runner build

build_runner_delete_conflicting_outputs:
	dart pub run build_runner build --delete-conflicting-outputs

build_runner_clean:
	dart pub run build_runner clean

clean: 
	flutter clean

run:
	flutter run --dart-define-from-file env.json

setup: 
	sh scripts/create-env-json.sh
	flutter pub get