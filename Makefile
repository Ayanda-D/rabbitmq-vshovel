PROJECT = rabbitmq_vshovel
PROJECT_DESCRIPTION = Variable Data Shovel for RabbitMQ
PROJECT_MOD = rabbit_vshovel

define PROJECT_ENV
[
	    {defaults, [
	        {prefetch_count,     1},
	        {ack_mode,           on_confirm},
	        {publish_fields,     []},
	        {publish_properties, []},
	        {reconnect_delay,    5}
	      ]}
	  ]
endef

define PROJECT_APP_EXTRA_KEYS
	{broker_version_requirements, []}
endef

DEPS = amqp_client
TEST_DEPS = amqp_client rabbitmq_ct_helpers rabbitmq_ct_client_helpers gun
LOCAL_DEPS = public_key crypto ssl inets

dep_amqp_client = git https://github.com/rabbitmq/rabbitmq-erlang-client rabbitmq_v3_6_5

DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk