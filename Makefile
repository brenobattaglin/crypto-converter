build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

clean: 
	sh scripts/clean.sh

setup: 
	sh scripts/setup.sh