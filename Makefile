PORT?=3000
RACK_ENV?=development

render-build:
	bundle install
	bundle exec rails assets:precompile
	bundle exec rails assets:clean
	bundle exec rails db:migrate

render-start:
	bundle exec puma -t 5:5 -p ${PORT} -e ${RACK_ENV}

start:
	rm -rf tmp/pids/server.pid || true
	bin/dev

setup:
	bundle install
	bin/rails assets:precompile
	bundle exec rails db:migrate
	make db-prepare

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

check: test lint

clean-assets:
	rm -rf tmp/cache/assets/* public/assets/* app/assets/builds/*

test:
	make clean-assets
	RAILS_ENV=test \
	ASSETS_PRECOMPILE=false \
	SKIP_ASSET_COMPILATION=true \
	BUILD_JS_COMMAND=: \
	BUILD_CSS_COMMAND=: \
	NODE_ENV=test \
	DISABLE_JS_BUILD=true \
	DISABLE_CSS_BUILD=true \
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

compose-production-run-app:
	docker compose -p rails_bulletin_board_project_ru-production -f docker-compose.production.yml build
	docker compose -p rails_bulletin_board_project_ru-production -f docker-compose.production.yml up

compose-production-console:
	docker compose -p rails_bulletin_board_project_ru-production -f docker-compose.production.yml exec app bin/rails console

.PHONY: test
