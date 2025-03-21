--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Debian 16.8-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO admin;

\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO admin;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO admin;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO admin;

--
-- Name: client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO admin;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO admin;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO admin;

--
-- Name: component; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO admin;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO admin;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO admin;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO admin;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO admin;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO admin;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO admin;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO admin;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO admin;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO admin;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO admin;

--
-- Name: org; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO admin;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO admin;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO admin;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO admin;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO admin;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO admin;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO admin;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO admin;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO admin;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO admin;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO admin;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO admin;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO admin;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO admin;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO admin;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO admin;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
f5256f82-b158-498a-8830-e29ad62f26b1	\N	auth-cookie	1739fb5b-3e74-44ff-bfea-37693723158e	b04802bd-a6b6-48bd-b85b-18d98a058c30	2	10	f	\N	\N
e37c024f-244e-42e9-8474-37113f162cc7	\N	auth-spnego	1739fb5b-3e74-44ff-bfea-37693723158e	b04802bd-a6b6-48bd-b85b-18d98a058c30	3	20	f	\N	\N
d1e5badc-4c2a-4577-91f3-bd131e0868a9	\N	identity-provider-redirector	1739fb5b-3e74-44ff-bfea-37693723158e	b04802bd-a6b6-48bd-b85b-18d98a058c30	2	25	f	\N	\N
ca6e15e2-d5ab-4246-86e5-b1574fe0d320	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	b04802bd-a6b6-48bd-b85b-18d98a058c30	2	30	t	202e91a5-a667-4bc3-ab8b-1a94806ea28a	\N
3abef57b-b912-441c-97f8-13136f39c6e9	\N	auth-username-password-form	1739fb5b-3e74-44ff-bfea-37693723158e	202e91a5-a667-4bc3-ab8b-1a94806ea28a	0	10	f	\N	\N
e34522b6-15bd-430e-a89c-ab0d39b6cb4c	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	202e91a5-a667-4bc3-ab8b-1a94806ea28a	1	20	t	75f238c1-e06c-4f77-940e-6647b5a2628d	\N
3e74304e-5712-4644-8714-c492eece6613	\N	conditional-user-configured	1739fb5b-3e74-44ff-bfea-37693723158e	75f238c1-e06c-4f77-940e-6647b5a2628d	0	10	f	\N	\N
8a4351b8-22f7-47d8-8838-95e0e687f614	\N	auth-otp-form	1739fb5b-3e74-44ff-bfea-37693723158e	75f238c1-e06c-4f77-940e-6647b5a2628d	0	20	f	\N	\N
553b9fee-fe2e-4da8-86c0-f5e4dd717734	\N	direct-grant-validate-username	1739fb5b-3e74-44ff-bfea-37693723158e	896d433b-a2bb-43f8-a918-d4db5ae55bb1	0	10	f	\N	\N
1b59557d-13e2-4739-88b9-74bdcdcaee46	\N	direct-grant-validate-password	1739fb5b-3e74-44ff-bfea-37693723158e	896d433b-a2bb-43f8-a918-d4db5ae55bb1	0	20	f	\N	\N
cbe5dbda-069f-4ebb-8efd-6962bf7f15e9	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	896d433b-a2bb-43f8-a918-d4db5ae55bb1	1	30	t	9e6dcb6e-94d2-48d6-9b4f-90d734d42767	\N
e5ce13e0-845a-4b2c-9a73-7783cf7e5103	\N	conditional-user-configured	1739fb5b-3e74-44ff-bfea-37693723158e	9e6dcb6e-94d2-48d6-9b4f-90d734d42767	0	10	f	\N	\N
af31b557-4f71-4717-b523-ac1a6fe55ee0	\N	direct-grant-validate-otp	1739fb5b-3e74-44ff-bfea-37693723158e	9e6dcb6e-94d2-48d6-9b4f-90d734d42767	0	20	f	\N	\N
445e670b-f0d1-43b9-bbd4-e00d8c23c1ab	\N	registration-page-form	1739fb5b-3e74-44ff-bfea-37693723158e	5eca29a5-7cf9-429e-bff8-a4ff6bb70be7	0	10	t	15dcd6f0-024d-45f0-a25e-6c2ae407a19f	\N
a3cb7481-36e9-4f62-ae0f-f08d6a651c57	\N	registration-user-creation	1739fb5b-3e74-44ff-bfea-37693723158e	15dcd6f0-024d-45f0-a25e-6c2ae407a19f	0	20	f	\N	\N
1eee9d60-2b1d-47e3-846c-b2c26c5d0652	\N	registration-password-action	1739fb5b-3e74-44ff-bfea-37693723158e	15dcd6f0-024d-45f0-a25e-6c2ae407a19f	0	50	f	\N	\N
57d21424-bf3a-43d7-86e8-f29683019083	\N	registration-recaptcha-action	1739fb5b-3e74-44ff-bfea-37693723158e	15dcd6f0-024d-45f0-a25e-6c2ae407a19f	3	60	f	\N	\N
d2098466-6712-4fd5-8d17-aa11432ba2d7	\N	registration-terms-and-conditions	1739fb5b-3e74-44ff-bfea-37693723158e	15dcd6f0-024d-45f0-a25e-6c2ae407a19f	3	70	f	\N	\N
beaea527-a0b7-4099-8a21-692293009c75	\N	reset-credentials-choose-user	1739fb5b-3e74-44ff-bfea-37693723158e	7cf8f60f-b50b-4500-a745-b57e810c3ffd	0	10	f	\N	\N
56af89e6-3518-4dd4-9a5e-be32b6ceaf26	\N	reset-credential-email	1739fb5b-3e74-44ff-bfea-37693723158e	7cf8f60f-b50b-4500-a745-b57e810c3ffd	0	20	f	\N	\N
d0850ad1-3937-4c7e-8eac-17b3deaa110b	\N	reset-password	1739fb5b-3e74-44ff-bfea-37693723158e	7cf8f60f-b50b-4500-a745-b57e810c3ffd	0	30	f	\N	\N
51e65648-17c7-419b-89ae-83ebe9c7e34b	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	7cf8f60f-b50b-4500-a745-b57e810c3ffd	1	40	t	eb9c334b-199c-4c20-963e-3f2e88313886	\N
3abb64d8-2de4-4364-8915-d0f80af8540b	\N	conditional-user-configured	1739fb5b-3e74-44ff-bfea-37693723158e	eb9c334b-199c-4c20-963e-3f2e88313886	0	10	f	\N	\N
e4fd68f3-35f0-4949-81be-fc7d51a9877d	\N	reset-otp	1739fb5b-3e74-44ff-bfea-37693723158e	eb9c334b-199c-4c20-963e-3f2e88313886	0	20	f	\N	\N
1ea5c46d-688b-4737-ab91-f313c6a92bcb	\N	client-secret	1739fb5b-3e74-44ff-bfea-37693723158e	bc467cb0-350c-41c7-8ed5-07a0d6055c24	2	10	f	\N	\N
ecca0103-25d3-4ac4-80f2-ab053adfa47a	\N	client-jwt	1739fb5b-3e74-44ff-bfea-37693723158e	bc467cb0-350c-41c7-8ed5-07a0d6055c24	2	20	f	\N	\N
c553e6d3-1325-427a-bae7-dd77b247454a	\N	client-secret-jwt	1739fb5b-3e74-44ff-bfea-37693723158e	bc467cb0-350c-41c7-8ed5-07a0d6055c24	2	30	f	\N	\N
97bf9439-fb61-4365-95fb-6a816988dc5b	\N	client-x509	1739fb5b-3e74-44ff-bfea-37693723158e	bc467cb0-350c-41c7-8ed5-07a0d6055c24	2	40	f	\N	\N
45d3e14e-551c-4285-be8f-196822d1f6db	\N	idp-review-profile	1739fb5b-3e74-44ff-bfea-37693723158e	78f500dd-830b-49a3-a2b5-811e11dba651	0	10	f	\N	cd0093f2-a54e-4e00-b824-a549c6c343ac
8919c63f-e10f-45e4-b1bd-7500958fbb7a	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	78f500dd-830b-49a3-a2b5-811e11dba651	0	20	t	1a287f5e-625c-4043-9836-f9ce8c1f43a3	\N
24f53766-fb5d-44df-9ea6-e3f4b09dab45	\N	idp-create-user-if-unique	1739fb5b-3e74-44ff-bfea-37693723158e	1a287f5e-625c-4043-9836-f9ce8c1f43a3	2	10	f	\N	32431e05-69e7-44b6-bc83-c8086ce5d17b
adb2ee64-a09c-45f6-859e-595c5bcdcde0	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	1a287f5e-625c-4043-9836-f9ce8c1f43a3	2	20	t	53eb0f04-5476-4c45-80b9-2cdf3beac93f	\N
57515c89-2e59-472b-a218-c694e968b62a	\N	idp-confirm-link	1739fb5b-3e74-44ff-bfea-37693723158e	53eb0f04-5476-4c45-80b9-2cdf3beac93f	0	10	f	\N	\N
eaa2d4fa-a893-47ec-950f-e8d924bef25c	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	53eb0f04-5476-4c45-80b9-2cdf3beac93f	0	20	t	158fc1a8-54ca-44e3-bed1-36dc83215b8b	\N
48b1eeb6-9f10-4e63-bcc1-4bffabfde55f	\N	idp-email-verification	1739fb5b-3e74-44ff-bfea-37693723158e	158fc1a8-54ca-44e3-bed1-36dc83215b8b	2	10	f	\N	\N
e7de214c-1ac8-4767-ba53-2243725d21da	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	158fc1a8-54ca-44e3-bed1-36dc83215b8b	2	20	t	46e13ca4-e64b-4895-8e1a-5b1831d6c727	\N
2994a8fe-db6a-4844-9603-1f4824a8d731	\N	idp-username-password-form	1739fb5b-3e74-44ff-bfea-37693723158e	46e13ca4-e64b-4895-8e1a-5b1831d6c727	0	10	f	\N	\N
004508a1-e020-4bf5-8482-d4fcf4ee178c	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	46e13ca4-e64b-4895-8e1a-5b1831d6c727	1	20	t	499e8a2a-dd58-4b8c-a71c-354f2fc114c0	\N
7e73025e-9053-4efd-9281-40823ad426b2	\N	conditional-user-configured	1739fb5b-3e74-44ff-bfea-37693723158e	499e8a2a-dd58-4b8c-a71c-354f2fc114c0	0	10	f	\N	\N
254216f3-f44f-439f-8c38-3e9c85268ffe	\N	auth-otp-form	1739fb5b-3e74-44ff-bfea-37693723158e	499e8a2a-dd58-4b8c-a71c-354f2fc114c0	0	20	f	\N	\N
cf360287-c5f8-4552-a024-4c2762b6cc73	\N	http-basic-authenticator	1739fb5b-3e74-44ff-bfea-37693723158e	48118f3a-64fe-47e1-8347-d868649bd7d4	0	10	f	\N	\N
07b2d3e1-c627-43ac-aa3d-7b120b98bd7a	\N	docker-http-basic-authenticator	1739fb5b-3e74-44ff-bfea-37693723158e	c55bc4f7-5884-45a4-87e3-0ca3214a798c	0	10	f	\N	\N
18f487bd-4b96-4810-b299-3770aa453c6b	\N	auth-cookie	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e6247dd5-c46f-4ee1-9ce8-683d67da3076	2	10	f	\N	\N
1948e24b-60f9-4ada-87fb-f240a54878e0	\N	auth-spnego	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e6247dd5-c46f-4ee1-9ce8-683d67da3076	3	20	f	\N	\N
5dbc571b-c72c-41d0-ba3a-4ee89b726128	\N	identity-provider-redirector	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e6247dd5-c46f-4ee1-9ce8-683d67da3076	2	25	f	\N	\N
53ab8a33-a1ad-41c1-b7a0-2c0f65088755	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e6247dd5-c46f-4ee1-9ce8-683d67da3076	2	30	t	ed8feaa1-ff8d-419d-b442-8e1ca9dda1a4	\N
59814ff9-7d1a-479d-95b8-8f33e7d308d6	\N	auth-username-password-form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ed8feaa1-ff8d-419d-b442-8e1ca9dda1a4	0	10	f	\N	\N
66d70516-e330-493c-8f19-dbb82df90f46	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ed8feaa1-ff8d-419d-b442-8e1ca9dda1a4	1	20	t	feaa7fad-ab08-4e65-a11b-bcbaa0719e0c	\N
ddd86392-226a-4dc8-816b-3bfae5d597a0	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	feaa7fad-ab08-4e65-a11b-bcbaa0719e0c	0	10	f	\N	\N
622cab2a-e485-4c75-85d5-a0f41588c9fc	\N	auth-otp-form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	feaa7fad-ab08-4e65-a11b-bcbaa0719e0c	0	20	f	\N	\N
d1d2f8c2-dd00-42e9-b3ff-d592125f0e31	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e6247dd5-c46f-4ee1-9ce8-683d67da3076	2	26	t	2894c967-0a85-416b-9ea7-bdfbbf8b37b6	\N
fcf21e82-950b-419c-9d42-6ca24b1f4f76	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	2894c967-0a85-416b-9ea7-bdfbbf8b37b6	1	10	t	40788d41-3ebf-46bf-ad50-8965876e61b5	\N
a318459c-20d6-433c-ad44-0ee171a734c6	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	40788d41-3ebf-46bf-ad50-8965876e61b5	0	10	f	\N	\N
251c731b-e273-403d-bc59-9e3031756657	\N	organization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	40788d41-3ebf-46bf-ad50-8965876e61b5	2	20	f	\N	\N
f13af676-a360-4883-aa0c-641fa19ceaa3	\N	direct-grant-validate-username	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	25420f07-b172-487b-ac2a-6361582d68d2	0	10	f	\N	\N
25c3e04a-7d21-4caa-a7c7-fef1c09e31b2	\N	direct-grant-validate-password	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	25420f07-b172-487b-ac2a-6361582d68d2	0	20	f	\N	\N
edffdd6d-44dc-467c-9fbe-b3831c9fe23b	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	25420f07-b172-487b-ac2a-6361582d68d2	1	30	t	d7f2f8c8-ba83-4499-9140-1dea48e0b7a0	\N
2712fa17-ca5b-4b0a-95b0-20472eabd03a	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	d7f2f8c8-ba83-4499-9140-1dea48e0b7a0	0	10	f	\N	\N
d88ea0e3-1ef7-43e9-b726-d7093cd088af	\N	direct-grant-validate-otp	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	d7f2f8c8-ba83-4499-9140-1dea48e0b7a0	0	20	f	\N	\N
4608dd6c-1e6a-433d-ad67-a3af1f6964ac	\N	registration-page-form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5191598e-5f46-413a-ad4b-84cf497793b8	0	10	t	defe7264-7be4-496d-b2e5-6272041c402b	\N
9e001fa8-162b-4b0b-b96a-7e64bbd12b32	\N	registration-user-creation	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	defe7264-7be4-496d-b2e5-6272041c402b	0	20	f	\N	\N
a0afa2a4-45cb-4ae7-9a8d-6698113a4c4d	\N	registration-password-action	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	defe7264-7be4-496d-b2e5-6272041c402b	0	50	f	\N	\N
b5aa2acf-7fab-438d-bb93-f4477658c58d	\N	registration-recaptcha-action	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	defe7264-7be4-496d-b2e5-6272041c402b	3	60	f	\N	\N
beb97ab5-e965-4ebe-b103-a1db42b459e7	\N	registration-terms-and-conditions	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	defe7264-7be4-496d-b2e5-6272041c402b	3	70	f	\N	\N
46a00855-66c5-4544-b130-8128e44a7450	\N	reset-credentials-choose-user	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	044b35a1-707b-4c17-bb3d-ed0459948a7f	0	10	f	\N	\N
f030d02d-1562-48f6-ad4e-3074c6a1912d	\N	reset-credential-email	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	044b35a1-707b-4c17-bb3d-ed0459948a7f	0	20	f	\N	\N
ab5f2330-fe73-4ba6-b664-995e5b785113	\N	reset-password	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	044b35a1-707b-4c17-bb3d-ed0459948a7f	0	30	f	\N	\N
a9864e1e-7089-42c7-a30d-7601a88815aa	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	044b35a1-707b-4c17-bb3d-ed0459948a7f	1	40	t	c75de6b9-138d-4dc2-b363-437ad64e0075	\N
7c72b003-f1c3-4bb1-a79b-af91fa1b7cc1	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	c75de6b9-138d-4dc2-b363-437ad64e0075	0	10	f	\N	\N
9f9f8793-52bc-4893-8d74-c2f55e427054	\N	reset-otp	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	c75de6b9-138d-4dc2-b363-437ad64e0075	0	20	f	\N	\N
a5172082-1b74-454c-af57-acadfe3757c2	\N	client-secret	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	cd4d8776-38b0-417e-b4b6-412b14d5946b	2	10	f	\N	\N
6f1ac91b-e7c9-41d8-bdde-ea808ce9e95e	\N	client-jwt	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	cd4d8776-38b0-417e-b4b6-412b14d5946b	2	20	f	\N	\N
99f148a0-3c22-403e-99d4-02d9d51c4137	\N	client-secret-jwt	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	cd4d8776-38b0-417e-b4b6-412b14d5946b	2	30	f	\N	\N
b2e665fd-3f56-456c-aa7d-36ac3537e308	\N	client-x509	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	cd4d8776-38b0-417e-b4b6-412b14d5946b	2	40	f	\N	\N
d0d37b99-f483-4e6b-abac-4c1167a21cd7	\N	idp-review-profile	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	a679397d-ce45-4a94-9f3f-0e4b78a7b044	0	10	f	\N	6986137c-2ed4-46e7-843b-074ce2ddcfcc
76e8ccca-f8e3-4161-9972-05393e6f06b3	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	a679397d-ce45-4a94-9f3f-0e4b78a7b044	0	20	t	2003d5ff-9bcc-4b96-bc64-2980d0fbc9aa	\N
65c4384a-24e7-4ecc-a5f4-19b2ce670863	\N	idp-create-user-if-unique	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	2003d5ff-9bcc-4b96-bc64-2980d0fbc9aa	2	10	f	\N	e2954cc7-a114-4495-8cc8-1162c42ed414
1585133a-e048-4720-a10d-d675f0acb462	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	2003d5ff-9bcc-4b96-bc64-2980d0fbc9aa	2	20	t	5c3011fc-a0ae-4d71-9662-c198fc30764d	\N
2f5a51bf-9f2c-461d-8d9d-33815a6706c8	\N	idp-confirm-link	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5c3011fc-a0ae-4d71-9662-c198fc30764d	0	10	f	\N	\N
0afba408-bad8-478f-9715-5b8719398d3e	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5c3011fc-a0ae-4d71-9662-c198fc30764d	0	20	t	89ded564-5043-4a41-9d17-e85841b33549	\N
c25aeebd-a82e-4baf-a1f8-1ae90af00249	\N	idp-email-verification	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	89ded564-5043-4a41-9d17-e85841b33549	2	10	f	\N	\N
74122493-1403-4eb2-9c21-369d39bcdc82	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	89ded564-5043-4a41-9d17-e85841b33549	2	20	t	c71b505b-44bf-4675-8d61-42832c8953cd	\N
2817167e-900a-4807-ab90-5c912579304e	\N	idp-username-password-form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	c71b505b-44bf-4675-8d61-42832c8953cd	0	10	f	\N	\N
33398df6-7a4a-474d-974d-e8ee542cc15c	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	c71b505b-44bf-4675-8d61-42832c8953cd	1	20	t	ff1474a6-6545-4735-8bfd-10a358691fc1	\N
b24dfe23-7d14-40f8-b931-6c648290d9d8	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ff1474a6-6545-4735-8bfd-10a358691fc1	0	10	f	\N	\N
80c08e1e-cde8-4f92-8eb0-f889b4a4dfc4	\N	auth-otp-form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ff1474a6-6545-4735-8bfd-10a358691fc1	0	20	f	\N	\N
9ca3348a-4521-4496-a244-95cfff3dda68	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	a679397d-ce45-4a94-9f3f-0e4b78a7b044	1	50	t	5789ecc5-2863-4496-9c2c-50322498ded2	\N
eca1eccc-cfcf-49d3-81d1-aa5e43294ff7	\N	conditional-user-configured	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5789ecc5-2863-4496-9c2c-50322498ded2	0	10	f	\N	\N
1eac4f64-f8f0-4aef-8141-a2406d408938	\N	idp-add-organization-member	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5789ecc5-2863-4496-9c2c-50322498ded2	0	20	f	\N	\N
1b81745f-f3ff-49f8-80cb-7ec256e80a1a	\N	http-basic-authenticator	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	7a17b024-909b-4439-9942-4013264cea0e	0	10	f	\N	\N
64d6a15c-9fa5-4389-8bc1-3b1460b669cc	\N	docker-http-basic-authenticator	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5106f02d-1860-4986-a02d-a5f0ccf1e7a7	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
b04802bd-a6b6-48bd-b85b-18d98a058c30	browser	Browser based authentication	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
202e91a5-a667-4bc3-ab8b-1a94806ea28a	forms	Username, password, otp and other auth forms.	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
75f238c1-e06c-4f77-940e-6647b5a2628d	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
896d433b-a2bb-43f8-a918-d4db5ae55bb1	direct grant	OpenID Connect Resource Owner Grant	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
9e6dcb6e-94d2-48d6-9b4f-90d734d42767	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
5eca29a5-7cf9-429e-bff8-a4ff6bb70be7	registration	Registration flow	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
15dcd6f0-024d-45f0-a25e-6c2ae407a19f	registration form	Registration form	1739fb5b-3e74-44ff-bfea-37693723158e	form-flow	f	t
7cf8f60f-b50b-4500-a745-b57e810c3ffd	reset credentials	Reset credentials for a user if they forgot their password or something	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
eb9c334b-199c-4c20-963e-3f2e88313886	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
bc467cb0-350c-41c7-8ed5-07a0d6055c24	clients	Base authentication for clients	1739fb5b-3e74-44ff-bfea-37693723158e	client-flow	t	t
78f500dd-830b-49a3-a2b5-811e11dba651	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
1a287f5e-625c-4043-9836-f9ce8c1f43a3	User creation or linking	Flow for the existing/non-existing user alternatives	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
53eb0f04-5476-4c45-80b9-2cdf3beac93f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
158fc1a8-54ca-44e3-bed1-36dc83215b8b	Account verification options	Method with which to verity the existing account	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
46e13ca4-e64b-4895-8e1a-5b1831d6c727	Verify Existing Account by Re-authentication	Reauthentication of existing account	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
499e8a2a-dd58-4b8c-a71c-354f2fc114c0	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	f	t
48118f3a-64fe-47e1-8347-d868649bd7d4	saml ecp	SAML ECP Profile Authentication Flow	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
c55bc4f7-5884-45a4-87e3-0ca3214a798c	docker auth	Used by Docker clients to authenticate against the IDP	1739fb5b-3e74-44ff-bfea-37693723158e	basic-flow	t	t
e6247dd5-c46f-4ee1-9ce8-683d67da3076	browser	Browser based authentication	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
ed8feaa1-ff8d-419d-b442-8e1ca9dda1a4	forms	Username, password, otp and other auth forms.	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
feaa7fad-ab08-4e65-a11b-bcbaa0719e0c	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
2894c967-0a85-416b-9ea7-bdfbbf8b37b6	Organization	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
40788d41-3ebf-46bf-ad50-8965876e61b5	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
25420f07-b172-487b-ac2a-6361582d68d2	direct grant	OpenID Connect Resource Owner Grant	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
d7f2f8c8-ba83-4499-9140-1dea48e0b7a0	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
5191598e-5f46-413a-ad4b-84cf497793b8	registration	Registration flow	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
defe7264-7be4-496d-b2e5-6272041c402b	registration form	Registration form	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	form-flow	f	t
044b35a1-707b-4c17-bb3d-ed0459948a7f	reset credentials	Reset credentials for a user if they forgot their password or something	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
c75de6b9-138d-4dc2-b363-437ad64e0075	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
cd4d8776-38b0-417e-b4b6-412b14d5946b	clients	Base authentication for clients	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	client-flow	t	t
a679397d-ce45-4a94-9f3f-0e4b78a7b044	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
2003d5ff-9bcc-4b96-bc64-2980d0fbc9aa	User creation or linking	Flow for the existing/non-existing user alternatives	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
5c3011fc-a0ae-4d71-9662-c198fc30764d	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
89ded564-5043-4a41-9d17-e85841b33549	Account verification options	Method with which to verity the existing account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
c71b505b-44bf-4675-8d61-42832c8953cd	Verify Existing Account by Re-authentication	Reauthentication of existing account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
ff1474a6-6545-4735-8bfd-10a358691fc1	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
5789ecc5-2863-4496-9c2c-50322498ded2	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	f	t
7a17b024-909b-4439-9942-4013264cea0e	saml ecp	SAML ECP Profile Authentication Flow	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
5106f02d-1860-4986-a02d-a5f0ccf1e7a7	docker auth	Used by Docker clients to authenticate against the IDP	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
cd0093f2-a54e-4e00-b824-a549c6c343ac	review profile config	1739fb5b-3e74-44ff-bfea-37693723158e
32431e05-69e7-44b6-bc83-c8086ce5d17b	create unique user config	1739fb5b-3e74-44ff-bfea-37693723158e
6986137c-2ed4-46e7-843b-074ce2ddcfcc	review profile config	a3ade43b-1924-4f20-b0e0-9c9b991a47d2
e2954cc7-a114-4495-8cc8-1162c42ed414	create unique user config	a3ade43b-1924-4f20-b0e0-9c9b991a47d2
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
32431e05-69e7-44b6-bc83-c8086ce5d17b	false	require.password.update.after.registration
cd0093f2-a54e-4e00-b824-a549c6c343ac	missing	update.profile.on.first.login
6986137c-2ed4-46e7-843b-074ce2ddcfcc	missing	update.profile.on.first.login
e2954cc7-a114-4495-8cc8-1162c42ed414	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	f	master-realm	0	f	\N	\N	t	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	t	f	broker	0	f	\N	\N	t	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
74033654-fcf1-4ebe-877d-25e96dcdd914	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9235a301-4922-4507-9aa9-dfea8555fee7	t	t	admin-cli	0	t	\N	\N	f	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	f	task-flow-realm-realm	0	f	\N	\N	t	\N	f	1739fb5b-3e74-44ff-bfea-37693723158e	\N	0	f	f	task-flow-realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	f	realm-management	0	f	\N	\N	t	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	t	f	account	0	t	\N	/realms/task-flow-realm/account/	f	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
9a245b58-a810-42c8-a40e-f65528d330b3	t	f	account-console	0	t	\N	/realms/task-flow-realm/account/	f	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	t	f	broker	0	f	\N	\N	t	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	t	t	security-admin-console	0	t	\N	/admin/task-flow-realm/console/	f	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
70c94942-e930-4be8-832b-d577631214ac	t	t	admin-cli	0	t	\N	\N	f	\N	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
5081130b-b692-4acc-8759-2504425efa0a	t	t	tasks-api-swagger	0	f	qgdcKO2LJ8knahIMY8vlnciMjWFvkbhj		f	http://localhost:5002	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	-1	t	f		f	client-secret	http://localhost:5002		\N	t	f	t	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	t	t	tasks-api	0	t	\N		f	http://localhost:5002	f	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	openid-connect	-1	t	f		f	client-secret	http://localhost:5002		\N	f	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
38a5e274-e55b-45aa-87b0-c41c8443e5c5	post.logout.redirect.uris	+
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	post.logout.redirect.uris	+
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	pkce.code.challenge.method	S256
74033654-fcf1-4ebe-877d-25e96dcdd914	post.logout.redirect.uris	+
74033654-fcf1-4ebe-877d-25e96dcdd914	pkce.code.challenge.method	S256
74033654-fcf1-4ebe-877d-25e96dcdd914	client.use.lightweight.access.token.enabled	true
9235a301-4922-4507-9aa9-dfea8555fee7	client.use.lightweight.access.token.enabled	true
4fc86ede-2848-4493-bc3e-b175c51fcf68	post.logout.redirect.uris	+
9a245b58-a810-42c8-a40e-f65528d330b3	post.logout.redirect.uris	+
9a245b58-a810-42c8-a40e-f65528d330b3	pkce.code.challenge.method	S256
33909007-b1ae-48f2-b4e4-86cd51b4c359	post.logout.redirect.uris	+
33909007-b1ae-48f2-b4e4-86cd51b4c359	pkce.code.challenge.method	S256
33909007-b1ae-48f2-b4e4-86cd51b4c359	client.use.lightweight.access.token.enabled	true
70c94942-e930-4be8-832b-d577631214ac	client.use.lightweight.access.token.enabled	true
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	oauth2.device.authorization.grant.enabled	false
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	oidc.ciba.grant.enabled	false
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	backchannel.logout.session.required	true
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	backchannel.logout.revoke.offline.tokens	false
5081130b-b692-4acc-8759-2504425efa0a	client.secret.creation.time	1742332412
5081130b-b692-4acc-8759-2504425efa0a	oauth2.device.authorization.grant.enabled	false
5081130b-b692-4acc-8759-2504425efa0a	oidc.ciba.grant.enabled	false
5081130b-b692-4acc-8759-2504425efa0a	backchannel.logout.session.required	true
5081130b-b692-4acc-8759-2504425efa0a	backchannel.logout.revoke.offline.tokens	false
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	realm_client	false
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	display.on.consent.screen	false
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	frontchannel.logout.session.required	true
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
d6cb07ab-4951-45fc-88ed-ed46b63dd316	offline_access	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect built-in scope: offline_access	openid-connect
d0e40d61-1c99-4404-bb13-704061d4f54b	role_list	1739fb5b-3e74-44ff-bfea-37693723158e	SAML role list	saml
f4901175-2040-4d5f-8b64-06299d7a10c1	saml_organization	1739fb5b-3e74-44ff-bfea-37693723158e	Organization Membership	saml
9acccff7-1e16-442f-81f1-857b74c75505	profile	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect built-in scope: profile	openid-connect
b84e4c21-a69d-44d1-a18d-c4474ff52e2a	email	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect built-in scope: email	openid-connect
3b47e6fc-2020-4e11-9f53-1730bcabaa08	address	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect built-in scope: address	openid-connect
f80c2fc2-3e39-4496-bae6-cd753cb27f2c	phone	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect built-in scope: phone	openid-connect
76c46171-152e-4a41-8aca-92b8ae9cace9	roles	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect scope for add user roles to the access token	openid-connect
a2d2b413-9234-48c9-8ece-107cfd8886ca	web-origins	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect scope for add allowed web origins to the access token	openid-connect
aa569179-8629-4041-a8cd-0e5724155825	microprofile-jwt	1739fb5b-3e74-44ff-bfea-37693723158e	Microprofile - JWT built-in scope	openid-connect
0acc2d70-d6f4-4b43-8443-404bd99ca433	acr	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
38db5036-1332-40ad-b8ba-f9943cd8a9e1	basic	1739fb5b-3e74-44ff-bfea-37693723158e	OpenID Connect scope for add all basic claims to the token	openid-connect
8459a282-300e-4fd3-817f-539b0aec368c	service_account	1739fb5b-3e74-44ff-bfea-37693723158e	Specific scope for a client enabled for service accounts	openid-connect
37a83e85-767e-4291-a7c7-697adc4d5094	organization	1739fb5b-3e74-44ff-bfea-37693723158e	Additional claims about the organization a subject belongs to	openid-connect
2a980725-e7d1-438d-b2c4-d17ecfd44408	offline_access	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect built-in scope: offline_access	openid-connect
0748e898-feb5-44a7-a24a-17cf96458a6a	role_list	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	SAML role list	saml
1ed86071-c2a2-45e1-aa65-5549fcc4516d	saml_organization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	Organization Membership	saml
e767937a-a2bf-40c8-8c0b-a8c2205b89ba	profile	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect built-in scope: profile	openid-connect
3edd5931-a614-40d3-8d9e-b1efec6e5082	email	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect built-in scope: email	openid-connect
3764dde0-7038-47a4-853d-284b0d8e7ca6	address	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect built-in scope: address	openid-connect
01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	phone	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect built-in scope: phone	openid-connect
ff1512a3-e8ab-4b99-9711-8791bbdb60a6	roles	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect scope for add user roles to the access token	openid-connect
7f05a2cc-feb2-4799-90da-be7f09e042e3	web-origins	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect scope for add allowed web origins to the access token	openid-connect
c84fcbfe-7493-43aa-83f3-cc865f5f7a11	microprofile-jwt	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	Microprofile - JWT built-in scope	openid-connect
3f94be48-e9b8-40cf-a4f5-00575d1acf52	acr	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
32c2c35c-2d16-4ffa-beb5-a08c59328528	basic	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	OpenID Connect scope for add all basic claims to the token	openid-connect
b6c78390-46de-48e5-873c-12a84099dc40	service_account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	Specific scope for a client enabled for service accounts	openid-connect
f401c331-5a27-4523-867c-c52a5d7781ec	organization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	Additional claims about the organization a subject belongs to	openid-connect
51bf50af-846c-4786-a531-47422cb243d9	tasks-api-audience	a3ade43b-1924-4f20-b0e0-9c9b991a47d2		openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
d6cb07ab-4951-45fc-88ed-ed46b63dd316	true	display.on.consent.screen
d6cb07ab-4951-45fc-88ed-ed46b63dd316	${offlineAccessScopeConsentText}	consent.screen.text
d0e40d61-1c99-4404-bb13-704061d4f54b	true	display.on.consent.screen
d0e40d61-1c99-4404-bb13-704061d4f54b	${samlRoleListScopeConsentText}	consent.screen.text
f4901175-2040-4d5f-8b64-06299d7a10c1	false	display.on.consent.screen
9acccff7-1e16-442f-81f1-857b74c75505	true	display.on.consent.screen
9acccff7-1e16-442f-81f1-857b74c75505	${profileScopeConsentText}	consent.screen.text
9acccff7-1e16-442f-81f1-857b74c75505	true	include.in.token.scope
b84e4c21-a69d-44d1-a18d-c4474ff52e2a	true	display.on.consent.screen
b84e4c21-a69d-44d1-a18d-c4474ff52e2a	${emailScopeConsentText}	consent.screen.text
b84e4c21-a69d-44d1-a18d-c4474ff52e2a	true	include.in.token.scope
3b47e6fc-2020-4e11-9f53-1730bcabaa08	true	display.on.consent.screen
3b47e6fc-2020-4e11-9f53-1730bcabaa08	${addressScopeConsentText}	consent.screen.text
3b47e6fc-2020-4e11-9f53-1730bcabaa08	true	include.in.token.scope
f80c2fc2-3e39-4496-bae6-cd753cb27f2c	true	display.on.consent.screen
f80c2fc2-3e39-4496-bae6-cd753cb27f2c	${phoneScopeConsentText}	consent.screen.text
f80c2fc2-3e39-4496-bae6-cd753cb27f2c	true	include.in.token.scope
76c46171-152e-4a41-8aca-92b8ae9cace9	true	display.on.consent.screen
76c46171-152e-4a41-8aca-92b8ae9cace9	${rolesScopeConsentText}	consent.screen.text
76c46171-152e-4a41-8aca-92b8ae9cace9	false	include.in.token.scope
a2d2b413-9234-48c9-8ece-107cfd8886ca	false	display.on.consent.screen
a2d2b413-9234-48c9-8ece-107cfd8886ca		consent.screen.text
a2d2b413-9234-48c9-8ece-107cfd8886ca	false	include.in.token.scope
aa569179-8629-4041-a8cd-0e5724155825	false	display.on.consent.screen
aa569179-8629-4041-a8cd-0e5724155825	true	include.in.token.scope
0acc2d70-d6f4-4b43-8443-404bd99ca433	false	display.on.consent.screen
0acc2d70-d6f4-4b43-8443-404bd99ca433	false	include.in.token.scope
38db5036-1332-40ad-b8ba-f9943cd8a9e1	false	display.on.consent.screen
38db5036-1332-40ad-b8ba-f9943cd8a9e1	false	include.in.token.scope
8459a282-300e-4fd3-817f-539b0aec368c	false	display.on.consent.screen
8459a282-300e-4fd3-817f-539b0aec368c	false	include.in.token.scope
37a83e85-767e-4291-a7c7-697adc4d5094	true	display.on.consent.screen
37a83e85-767e-4291-a7c7-697adc4d5094	${organizationScopeConsentText}	consent.screen.text
37a83e85-767e-4291-a7c7-697adc4d5094	true	include.in.token.scope
2a980725-e7d1-438d-b2c4-d17ecfd44408	true	display.on.consent.screen
2a980725-e7d1-438d-b2c4-d17ecfd44408	${offlineAccessScopeConsentText}	consent.screen.text
0748e898-feb5-44a7-a24a-17cf96458a6a	true	display.on.consent.screen
0748e898-feb5-44a7-a24a-17cf96458a6a	${samlRoleListScopeConsentText}	consent.screen.text
1ed86071-c2a2-45e1-aa65-5549fcc4516d	false	display.on.consent.screen
e767937a-a2bf-40c8-8c0b-a8c2205b89ba	true	display.on.consent.screen
e767937a-a2bf-40c8-8c0b-a8c2205b89ba	${profileScopeConsentText}	consent.screen.text
e767937a-a2bf-40c8-8c0b-a8c2205b89ba	true	include.in.token.scope
3edd5931-a614-40d3-8d9e-b1efec6e5082	true	display.on.consent.screen
3edd5931-a614-40d3-8d9e-b1efec6e5082	${emailScopeConsentText}	consent.screen.text
3edd5931-a614-40d3-8d9e-b1efec6e5082	true	include.in.token.scope
3764dde0-7038-47a4-853d-284b0d8e7ca6	true	display.on.consent.screen
3764dde0-7038-47a4-853d-284b0d8e7ca6	${addressScopeConsentText}	consent.screen.text
3764dde0-7038-47a4-853d-284b0d8e7ca6	true	include.in.token.scope
01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	true	display.on.consent.screen
01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	${phoneScopeConsentText}	consent.screen.text
01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	true	include.in.token.scope
ff1512a3-e8ab-4b99-9711-8791bbdb60a6	true	display.on.consent.screen
ff1512a3-e8ab-4b99-9711-8791bbdb60a6	${rolesScopeConsentText}	consent.screen.text
ff1512a3-e8ab-4b99-9711-8791bbdb60a6	false	include.in.token.scope
7f05a2cc-feb2-4799-90da-be7f09e042e3	false	display.on.consent.screen
7f05a2cc-feb2-4799-90da-be7f09e042e3		consent.screen.text
7f05a2cc-feb2-4799-90da-be7f09e042e3	false	include.in.token.scope
c84fcbfe-7493-43aa-83f3-cc865f5f7a11	false	display.on.consent.screen
c84fcbfe-7493-43aa-83f3-cc865f5f7a11	true	include.in.token.scope
3f94be48-e9b8-40cf-a4f5-00575d1acf52	false	display.on.consent.screen
3f94be48-e9b8-40cf-a4f5-00575d1acf52	false	include.in.token.scope
32c2c35c-2d16-4ffa-beb5-a08c59328528	false	display.on.consent.screen
32c2c35c-2d16-4ffa-beb5-a08c59328528	false	include.in.token.scope
b6c78390-46de-48e5-873c-12a84099dc40	false	display.on.consent.screen
b6c78390-46de-48e5-873c-12a84099dc40	false	include.in.token.scope
f401c331-5a27-4523-867c-c52a5d7781ec	true	display.on.consent.screen
f401c331-5a27-4523-867c-c52a5d7781ec	${organizationScopeConsentText}	consent.screen.text
f401c331-5a27-4523-867c-c52a5d7781ec	true	include.in.token.scope
51bf50af-846c-4786-a531-47422cb243d9	true	display.on.consent.screen
51bf50af-846c-4786-a531-47422cb243d9		consent.screen.text
51bf50af-846c-4786-a531-47422cb243d9	false	include.in.token.scope
51bf50af-846c-4786-a531-47422cb243d9		gui.order
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
38a5e274-e55b-45aa-87b0-c41c8443e5c5	9acccff7-1e16-442f-81f1-857b74c75505	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	76c46171-152e-4a41-8aca-92b8ae9cace9	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
38a5e274-e55b-45aa-87b0-c41c8443e5c5	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
38a5e274-e55b-45aa-87b0-c41c8443e5c5	37a83e85-767e-4291-a7c7-697adc4d5094	f
38a5e274-e55b-45aa-87b0-c41c8443e5c5	aa569179-8629-4041-a8cd-0e5724155825	f
38a5e274-e55b-45aa-87b0-c41c8443e5c5	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
38a5e274-e55b-45aa-87b0-c41c8443e5c5	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	9acccff7-1e16-442f-81f1-857b74c75505	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	76c46171-152e-4a41-8aca-92b8ae9cace9	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	37a83e85-767e-4291-a7c7-697adc4d5094	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	aa569179-8629-4041-a8cd-0e5724155825	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
9235a301-4922-4507-9aa9-dfea8555fee7	9acccff7-1e16-442f-81f1-857b74c75505	t
9235a301-4922-4507-9aa9-dfea8555fee7	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
9235a301-4922-4507-9aa9-dfea8555fee7	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
9235a301-4922-4507-9aa9-dfea8555fee7	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
9235a301-4922-4507-9aa9-dfea8555fee7	76c46171-152e-4a41-8aca-92b8ae9cace9	t
9235a301-4922-4507-9aa9-dfea8555fee7	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
9235a301-4922-4507-9aa9-dfea8555fee7	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
9235a301-4922-4507-9aa9-dfea8555fee7	37a83e85-767e-4291-a7c7-697adc4d5094	f
9235a301-4922-4507-9aa9-dfea8555fee7	aa569179-8629-4041-a8cd-0e5724155825	f
9235a301-4922-4507-9aa9-dfea8555fee7	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
9235a301-4922-4507-9aa9-dfea8555fee7	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	9acccff7-1e16-442f-81f1-857b74c75505	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	76c46171-152e-4a41-8aca-92b8ae9cace9	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
e4e17d84-b458-4a43-8311-1a6a19d62b16	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	37a83e85-767e-4291-a7c7-697adc4d5094	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	aa569179-8629-4041-a8cd-0e5724155825	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
e4e17d84-b458-4a43-8311-1a6a19d62b16	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
0001e805-bf98-463b-a5bc-5d45e9cf9d51	9acccff7-1e16-442f-81f1-857b74c75505	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	76c46171-152e-4a41-8aca-92b8ae9cace9	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
0001e805-bf98-463b-a5bc-5d45e9cf9d51	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
0001e805-bf98-463b-a5bc-5d45e9cf9d51	37a83e85-767e-4291-a7c7-697adc4d5094	f
0001e805-bf98-463b-a5bc-5d45e9cf9d51	aa569179-8629-4041-a8cd-0e5724155825	f
0001e805-bf98-463b-a5bc-5d45e9cf9d51	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
0001e805-bf98-463b-a5bc-5d45e9cf9d51	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
74033654-fcf1-4ebe-877d-25e96dcdd914	9acccff7-1e16-442f-81f1-857b74c75505	t
74033654-fcf1-4ebe-877d-25e96dcdd914	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
74033654-fcf1-4ebe-877d-25e96dcdd914	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
74033654-fcf1-4ebe-877d-25e96dcdd914	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
74033654-fcf1-4ebe-877d-25e96dcdd914	76c46171-152e-4a41-8aca-92b8ae9cace9	t
74033654-fcf1-4ebe-877d-25e96dcdd914	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
74033654-fcf1-4ebe-877d-25e96dcdd914	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
74033654-fcf1-4ebe-877d-25e96dcdd914	37a83e85-767e-4291-a7c7-697adc4d5094	f
74033654-fcf1-4ebe-877d-25e96dcdd914	aa569179-8629-4041-a8cd-0e5724155825	f
74033654-fcf1-4ebe-877d-25e96dcdd914	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
74033654-fcf1-4ebe-877d-25e96dcdd914	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
4fc86ede-2848-4493-bc3e-b175c51fcf68	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	f401c331-5a27-4523-867c-c52a5d7781ec	f
4fc86ede-2848-4493-bc3e-b175c51fcf68	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
9a245b58-a810-42c8-a40e-f65528d330b3	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
9a245b58-a810-42c8-a40e-f65528d330b3	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
9a245b58-a810-42c8-a40e-f65528d330b3	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
9a245b58-a810-42c8-a40e-f65528d330b3	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
9a245b58-a810-42c8-a40e-f65528d330b3	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
9a245b58-a810-42c8-a40e-f65528d330b3	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
9a245b58-a810-42c8-a40e-f65528d330b3	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
9a245b58-a810-42c8-a40e-f65528d330b3	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
9a245b58-a810-42c8-a40e-f65528d330b3	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
9a245b58-a810-42c8-a40e-f65528d330b3	f401c331-5a27-4523-867c-c52a5d7781ec	f
9a245b58-a810-42c8-a40e-f65528d330b3	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
70c94942-e930-4be8-832b-d577631214ac	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
70c94942-e930-4be8-832b-d577631214ac	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
70c94942-e930-4be8-832b-d577631214ac	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
70c94942-e930-4be8-832b-d577631214ac	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
70c94942-e930-4be8-832b-d577631214ac	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
70c94942-e930-4be8-832b-d577631214ac	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
70c94942-e930-4be8-832b-d577631214ac	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
70c94942-e930-4be8-832b-d577631214ac	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
70c94942-e930-4be8-832b-d577631214ac	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
70c94942-e930-4be8-832b-d577631214ac	f401c331-5a27-4523-867c-c52a5d7781ec	f
70c94942-e930-4be8-832b-d577631214ac	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
5131c547-ba20-4a29-aef1-0d745a8a1ab1	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	f401c331-5a27-4523-867c-c52a5d7781ec	f
5131c547-ba20-4a29-aef1-0d745a8a1ab1	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	f401c331-5a27-4523-867c-c52a5d7781ec	f
0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
33909007-b1ae-48f2-b4e4-86cd51b4c359	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	f401c331-5a27-4523-867c-c52a5d7781ec	f
33909007-b1ae-48f2-b4e4-86cd51b4c359	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	f401c331-5a27-4523-867c-c52a5d7781ec	f
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
5081130b-b692-4acc-8759-2504425efa0a	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
5081130b-b692-4acc-8759-2504425efa0a	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
5081130b-b692-4acc-8759-2504425efa0a	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
5081130b-b692-4acc-8759-2504425efa0a	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
5081130b-b692-4acc-8759-2504425efa0a	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
5081130b-b692-4acc-8759-2504425efa0a	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
5081130b-b692-4acc-8759-2504425efa0a	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
5081130b-b692-4acc-8759-2504425efa0a	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
5081130b-b692-4acc-8759-2504425efa0a	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
5081130b-b692-4acc-8759-2504425efa0a	f401c331-5a27-4523-867c-c52a5d7781ec	f
5081130b-b692-4acc-8759-2504425efa0a	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
5081130b-b692-4acc-8759-2504425efa0a	51bf50af-846c-4786-a531-47422cb243d9	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
d6cb07ab-4951-45fc-88ed-ed46b63dd316	9eae89ed-4f02-46aa-aba3-ced63c1f6dcc
2a980725-e7d1-438d-b2c4-d17ecfd44408	e263c424-b27d-4071-bf97-82fbb2c786e8
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
66f1f73f-9b23-442d-a6cd-5c0539f9fb88	Trusted Hosts	1739fb5b-3e74-44ff-bfea-37693723158e	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
a94bf627-cc67-4dc9-87db-0ee46236dbec	Consent Required	1739fb5b-3e74-44ff-bfea-37693723158e	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
b225c760-0458-4617-95f5-0527014fe043	Full Scope Disabled	1739fb5b-3e74-44ff-bfea-37693723158e	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
46c56475-4c0d-44a6-bca7-9e0de96515c1	Max Clients Limit	1739fb5b-3e74-44ff-bfea-37693723158e	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
832d2bcd-5dac-49ba-90f0-e205a137c4fe	Allowed Protocol Mapper Types	1739fb5b-3e74-44ff-bfea-37693723158e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
6f7a989d-6cc0-4aa0-9967-6892404180fd	Allowed Client Scopes	1739fb5b-3e74-44ff-bfea-37693723158e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	anonymous
7b547975-09e5-4b6e-810b-c5658b9aa9e4	Allowed Protocol Mapper Types	1739fb5b-3e74-44ff-bfea-37693723158e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	authenticated
0b723429-5ad8-4563-813e-679c597b3efb	Allowed Client Scopes	1739fb5b-3e74-44ff-bfea-37693723158e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	authenticated
35a50405-3911-4747-8e0b-d5cd02a4f189	rsa-generated	1739fb5b-3e74-44ff-bfea-37693723158e	rsa-generated	org.keycloak.keys.KeyProvider	1739fb5b-3e74-44ff-bfea-37693723158e	\N
08e72197-e61c-4f7b-9e31-108008011be6	rsa-enc-generated	1739fb5b-3e74-44ff-bfea-37693723158e	rsa-enc-generated	org.keycloak.keys.KeyProvider	1739fb5b-3e74-44ff-bfea-37693723158e	\N
af14e02e-ab40-4234-802b-c5f3b901ac34	hmac-generated-hs512	1739fb5b-3e74-44ff-bfea-37693723158e	hmac-generated	org.keycloak.keys.KeyProvider	1739fb5b-3e74-44ff-bfea-37693723158e	\N
3fdb4846-4b0c-4aa7-aced-f2652942534f	aes-generated	1739fb5b-3e74-44ff-bfea-37693723158e	aes-generated	org.keycloak.keys.KeyProvider	1739fb5b-3e74-44ff-bfea-37693723158e	\N
f16fbd22-2ea9-4a81-9c36-7ab70b292818	\N	1739fb5b-3e74-44ff-bfea-37693723158e	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	1739fb5b-3e74-44ff-bfea-37693723158e	\N
115a6c2f-9232-41a8-87c4-8f52949de7cd	rsa-generated	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	rsa-generated	org.keycloak.keys.KeyProvider	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N
0ceee95e-844e-4928-be61-bdabeaab7c3b	rsa-enc-generated	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	rsa-enc-generated	org.keycloak.keys.KeyProvider	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N
bdd47a7d-942c-4250-8fbf-c2ecc19fe546	hmac-generated-hs512	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	hmac-generated	org.keycloak.keys.KeyProvider	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N
c712efd0-7fb0-4d3b-8259-f52ab5f84f06	aes-generated	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	aes-generated	org.keycloak.keys.KeyProvider	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N
1b8eabee-ded0-4a52-9880-6a94931abf2e	Trusted Hosts	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
a73bbd7c-297a-470d-8a89-c86f62cc905c	Consent Required	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
8ad19d06-aa92-4dc7-adba-c3403803bbb8	Full Scope Disabled	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
7d87a5c2-ba6c-4604-af4d-1601197326a6	Max Clients Limit	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
b341bdcf-6d21-4345-848d-f616be1bd4a2	Allowed Protocol Mapper Types	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
06fa9a9f-f930-4d6c-a367-cd770554ccae	Allowed Client Scopes	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	anonymous
882177db-4c31-4f9a-9eb3-2b8762d96238	Allowed Protocol Mapper Types	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	authenticated
a5fb3600-10b8-414b-ac89-7712f28122f7	Allowed Client Scopes	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
a6530b3d-e129-4df4-af65-035e1bda6559	6f7a989d-6cc0-4aa0-9967-6892404180fd	allow-default-scopes	true
5dd0f10d-353c-44a2-a45c-b4952e61e1bd	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	oidc-address-mapper
a39a0358-c875-411a-856f-4dc1b74e71f3	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	oidc-full-name-mapper
dc7f0664-31b1-4a65-9684-767b78b6b08f	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f694a579-03b6-4803-9025-591dfd57c6a7	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f8ec85c0-ac62-4ad5-9532-b422d14a1652	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	saml-user-property-mapper
498f5ac0-370d-4b89-b035-272d7d2d3165	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	saml-user-attribute-mapper
ff2481df-68f2-4650-9349-f40d408a8f9a	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d1537018-7b03-4c8f-a66b-61407ba17204	832d2bcd-5dac-49ba-90f0-e205a137c4fe	allowed-protocol-mapper-types	saml-role-list-mapper
b8d6aef0-ab36-4ddd-8df0-4431a8b691a9	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	saml-user-attribute-mapper
231b2326-3d35-4498-a39f-39c233642d0a	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	oidc-full-name-mapper
7ac00ce7-4cd3-4bfc-845e-c38557ca967d	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	oidc-address-mapper
cab9078f-f2d7-4fa7-8919-7258e3649fe5	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b25c679c-3abc-4911-82eb-998059b98cd9	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f9a165cf-c9ee-4de5-953c-ba8f32ac95be	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	saml-role-list-mapper
ea049dd0-b5bd-40e1-9e86-423dc3465857	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	saml-user-property-mapper
cc19f3eb-21f0-4219-9e4d-5b78d6957e74	7b547975-09e5-4b6e-810b-c5658b9aa9e4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6cb422ae-f199-4350-aa68-08b955cc6cc3	0b723429-5ad8-4563-813e-679c597b3efb	allow-default-scopes	true
58893cdb-8c87-439a-a14e-73e79f23f030	66f1f73f-9b23-442d-a6cd-5c0539f9fb88	client-uris-must-match	true
4c3037b1-e4bc-4964-a5dd-bdb95bd328a1	66f1f73f-9b23-442d-a6cd-5c0539f9fb88	host-sending-registration-request-must-match	true
3a737533-98c8-475a-9401-8181c665dc97	46c56475-4c0d-44a6-bca7-9e0de96515c1	max-clients	200
d0af8b06-c6c6-45f9-9aff-c4e0238d5bf8	f16fbd22-2ea9-4a81-9c36-7ab70b292818	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
7f1a429f-2aef-445f-ae6e-aa634fbf8296	35a50405-3911-4747-8e0b-d5cd02a4f189	keyUse	SIG
0b375846-1f90-47e4-a1d1-64ca6bc134c5	35a50405-3911-4747-8e0b-d5cd02a4f189	priority	100
dd1ebd5e-27f1-4ebd-9d7d-70b8f307f6c3	35a50405-3911-4747-8e0b-d5cd02a4f189	privateKey	MIIEowIBAAKCAQEA2AyoTWDrflwOcl1lok+lvRGX/k8GYx8VJR0T+5+67n4e4zSd+LEeoLvMU3it1143ADpcFtglOrVLdpj5ovY/NgBkm5oFnaAX8bUuptXag2CC7xxtIsaFc4Ex2GQ/M+oMr6PF4czz1knpcx+Gz+dbExUtuXpUcoXN2LvfRLJfjKg8SQ2jo9DXPfwztT0JqnQt0HcM0XaRr/+EZtkLQB148exmF+psD5iItUbwHCRIUa4ypgy3469qNdS6/f/442NbNDxumDsS7q+CtT0ZpHmSnAWxOcH/r3eHrzDeWB58Srs3MOyH8PEFO47tTt97+WXI2J5ap2JM366fbcA912RrdwIDAQABAoIBADKIm2El908h9xsW72vMl2am09de4o6SuZ5ps7/aN54LD+xy5TRDMXfFFWC8zGSgm9rIy7toKSUXPKRr2ZAdauGVq/KdTwz0YkVd7KCHSsoJ6/ZDvt8wcgx3PpJvuDzLVNZMRz+ucaZAuYL878p3Qd0vyfclPtVeqKw2HV3zHthGH3UkGAYPtRhQSn6V0tCpFJgtUSNSErb3gCip8nQpHsdPKizjyf/obWyH0zgHP86U+q4osOE+z9iN/DUvF7OgDS2v6YCoSZ66RNjXtTsQ4dutaeVo0md7bfLDxiZX4ce7OW7WzgRqa8c61vV5X0QHlKaoXivIOyeX4Qg5f57f2wECgYEA7hx3QEp34lUMiwWpJZbNAQcP9R3xKtEN5CzxEHP88mxjSx+lhGMzVxfYXpgTII7jWiw26RrlgTLJkIuyCTdVnArKbm3P4nuHWD8nLim/ynRRFK9ZoUZOparweMBmYKCWRxl3rwqKiwz6OHH8fixzwDd2SH0RxzpFHqHEfvOIYIECgYEA6EfiI2JNqiRZglPA9WMQpnYaTIwazYK8zO4rECfE5Dyn9aTATk1hNq0GoSZev3ySJLo+CLxV25hqIMp17347ZGIO3TPKhuySCWA/vIFJfWUXb0kdK42WAzr7ufG70ECQgJDDk0F6EEYmyBAidQjV5h9gq999ewLMz02z+FVHz/cCgYA3nShxOLN1hp3OXr0aDXXGVqrwelTYxkkzURfg2uZqjMxIQJT9LdpQ7j3YIjbddOI/LnKI0YJnQcB4ZVho9KanMpIDZtyWLnn3L5DsJE4qcC574VTS6UP3R8ywt2dyDC/tXVJp7NFdFuPeiSkLI0DJ1WpoFeYwHTkFpYzqheEFgQKBgAWoGn26GyIVmIhv+bcAHpuvLJzInK58jJSBCFNwZH8aawy0YmqFv+RQ+mRaRtxq8DQsxO35iC283HjH9W9Lp66eJLaGWFxIzpWj3ml8zIldOODg6vDwlcKmYRL6LBS6Pcqju9+OLKbQzoj4u54WBP+BrB0DaE7ilpJF1igqC4GpAoGBANJUeLGFVxL5VSSlhiHTMYJGfd5I+mRVO8b2Ooe/iDGYawusS8o36AO2Q6KKs9Cr8loBgKdQGx0pScWksNvGJXfSp7jMD081vB0t5aouc4vUzx5KJvBI0D/VjRAo/oo3KribiLKdLP7Id+i18lK0jfaf7nBsoRbnJx8upw6gbdmI
00d49309-874b-4063-bb30-bcf40409fc53	35a50405-3911-4747-8e0b-d5cd02a4f189	certificate	MIICmzCCAYMCBgGVqxkKcjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwMzE4MjEwOTU5WhcNMzUwMzE4MjExMTM5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDYDKhNYOt+XA5yXWWiT6W9EZf+TwZjHxUlHRP7n7rufh7jNJ34sR6gu8xTeK3XXjcAOlwW2CU6tUt2mPmi9j82AGSbmgWdoBfxtS6m1dqDYILvHG0ixoVzgTHYZD8z6gyvo8XhzPPWSelzH4bP51sTFS25elRyhc3Yu99Esl+MqDxJDaOj0Nc9/DO1PQmqdC3QdwzRdpGv/4Rm2QtAHXjx7GYX6mwPmIi1RvAcJEhRrjKmDLfjr2o11Lr9//jjY1s0PG6YOxLur4K1PRmkeZKcBbE5wf+vd4evMN5YHnxKuzcw7Ifw8QU7ju1O33v5ZcjYnlqnYkzfrp9twD3XZGt3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBACHllYLny79rjBN82hLMKHv36rK8W48Wu9KHRxCBTB+45MKgpGmQnTwM23H3eDwdSv8pk6gRgK3RlysE3KWKxUc47TeIZ4aAHinL3lLpVdZk7s/0TQGAVyGiC0KQJCvapfMDzg2VnsIc0PM2G7kild/q/Rk9fk1WvB7a4VncJw4GS1bM3pAj1K2CoQ5z6vQMxdKC8FZRtLRit+ZE8pbFrPeN4GwX5pNhsDImUL0DDVyTM4uVjWhWsG5brVGq9RIygoXcMYMI4G5iTRI7jjk9Kabckefznb086IiE9G4AdmturcEYX6JBNdEyuM4aC/ueqewfQRl3DROhr7Ql6deiezY=
f705b54c-403a-40db-9355-7b262d9de155	c712efd0-7fb0-4d3b-8259-f52ab5f84f06	kid	b8e33fbd-dc50-49c6-b203-3f2831d5c188
57a6cf57-4fe4-4a84-8db7-509867de2b28	c712efd0-7fb0-4d3b-8259-f52ab5f84f06	priority	100
295bc8e8-5a5f-4f59-942d-7091f1e6ca8b	115a6c2f-9232-41a8-87c4-8f52949de7cd	priority	100
2d53b827-0554-49cd-93d1-c0b14c939982	08e72197-e61c-4f7b-9e31-108008011be6	certificate	MIICmzCCAYMCBgGVqxkLkzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwMzE4MjExMDAwWhcNMzUwMzE4MjExMTQwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCkm6KvwwxO8dZg1YSlnlJoOt/QzHN1Z9h6V6xRhtrQ+vIrmDFOko4eHGAgJZczXaGyKkbb1ZBb/alF08UXhsQVqdl77XutYbQDm6sr58TiVPmQbOfgHkcdNrpy1ChcjU4Uvb0tVseIRpNL9Fxw2t7+mWXzs3U/yxJaIRwlNF1/vEbb8CUu/Bg8u4IjrzpMX8//PwX1W6Bh1m/7Lo8DNERqKtd2epJFjl58B4GeGTfAxYoSXtVXiBn3vQ0baa2BNz/a076n0iReaAU8wOOJvQRq+kLvIcL11I5wvSf7RyASrhhLGDFkfBmK/XjKpstoairvUe+QQ1Av4vbgco1mNhJZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH9ilnStZuKz8FitvE4gUVHQjjE3Jkf0jGKKchsCa4l1NdH2MbjRfSM9ixtXYkkIFr6AQoM5FUe7Z8PKscKCE9h8rskaTycA/X8oTO0pd9JzWn62iVVkBe7+dz7f6TP/Ulw5tdDDV3oh3Q3ThR424GpRFydyM2ZZz/YdzsQCyoBsXuS3/N2LozXm5dh7JlmCPDhL0xhaiftWu92ETwOqB55DNBr7Q3SRz5HIrF9SuSoxYWedt401Idj1LlK8KFIKVzqtnxBK222OVHVxobUpEOfrSHfAI8fiCcUWF/dv5YSH2MLF1Evxc5iuzTz4JVxEkPIQ6EGymfTBckcS4T02y7o=
6e56bc0f-3a92-45e7-a275-66457a798346	08e72197-e61c-4f7b-9e31-108008011be6	priority	100
fea336a2-fe99-4a5f-a404-d3fdf72926fd	08e72197-e61c-4f7b-9e31-108008011be6	privateKey	MIIEogIBAAKCAQEApJuir8MMTvHWYNWEpZ5SaDrf0MxzdWfYelesUYba0PryK5gxTpKOHhxgICWXM12hsipG29WQW/2pRdPFF4bEFanZe+17rWG0A5urK+fE4lT5kGzn4B5HHTa6ctQoXI1OFL29LVbHiEaTS/RccNre/pll87N1P8sSWiEcJTRdf7xG2/AlLvwYPLuCI686TF/P/z8F9VugYdZv+y6PAzREairXdnqSRY5efAeBnhk3wMWKEl7VV4gZ970NG2mtgTc/2tO+p9IkXmgFPMDjib0EavpC7yHC9dSOcL0n+0cgEq4YSxgxZHwZiv14yqbLaGoq71HvkENQL+L24HKNZjYSWQIDAQABAoIBAAV+pdVE0dyyGUbi5GpRjkypEnQ6Lux6Cpw4NaoEXLo3IO2wRze+j/yUqTzJecee1i6dV1TanIFa8VNBuMWKm8cMBBTX85XxD1JDgwOUhAT4yIU4AsbUxpOaEmqSMcVieNBxGPyHdgz9gMiQn/lVxQst/FzrM6cX1JqqRPHqUpNYnCEAqejuET/M/pCUkA6WDv7sd6TQTb2+8hVfSuwGiwwFqRMvFbA5/de9+fb6jp/rlGB91hyl7DXfNT5sUQpVWdJlvC5mFhNsfOaiGA4NGPLNlEmmUT3qRgKafK/Wjcp+E1P5rL0zUVxuo+aoDPZCVNZczTno9DvyoT+R0qytFCUCgYEA5aohe5S4KwbyfnLRi2V43ikMtlp9gw3YvFw3KpsebNC/kDnufgzro9biawgDg5U4Hy0Lr8uNVkXKSflmEb4+jco1nYSl7gI+nSJTbYweYAcaOrNeMWFaRqfybZdiCEA0bD4A4mYGEd6aCsXevt+1pzYVtkddUFxA4ju9+hkDUQsCgYEAt3u/u7XOfvQ5x1HKxLprz5dNgpe22RmOjY1ojgdBcWn7eWDN+dr6uEIC6e3T1EFzP5cXeVqr1OvI+QFMzvqqgh3Gluvoev2pMXDd4BJQeRrBDOMv8QpzgIOnMrn0RWBblHw4a2fFp5crLq0jrlYAVP2T9Wh4/4awaX+QE2Ey0KsCgYBnxVOTr0L3zg/Lqr2bqqHOX+Xqj0Ce8qa3lUMn8SbyK/AijsqAEf527SUpD1nnHolZLNVW/TZDgQ1CF3pTEg7ZqkBHiCQhQspf3Z6spN8krJDhbSJmVYKg4knb0sbsy3XkYq+rnEWp1Vbs/zMCM7q0bu+oiN5U7Ro0HqJcWujwuQKBgHaJQOXg34XO++DT635KvUnAgreikeMRirHSMEDJWTMO+AKDUq5fFOii5MUB+369xdnIH8crl6UXqp+LgnaZJDypRdnMkEWcyIiDVSPkUQ7cBOnxf9BmIxZcd1DjJ3cGeEOmOMDSqrPJioE+I7YGI3LE26iIlNrnxeJyIb8TZUO/AoGAUxRHkahgE1J3WtaqrGluCC1I8ANKtQU0bmX2PdJQ/Mhbu7BKwRWhVWjCO308rsrplrWo89yT9kmIs3zCa0c0OTV6XQ53+W8gQsQvJsfpKcXvHZyUIsvL5cu4njw5m9HdsfIowtqdANKEkaWV6YGCiL8KDHwa3mgYe9DeZ8GS6JA=
adee5581-de59-4388-83d4-d81083ebe043	08e72197-e61c-4f7b-9e31-108008011be6	keyUse	ENC
7bd30628-1423-44e9-aa69-49b5bb027e40	08e72197-e61c-4f7b-9e31-108008011be6	algorithm	RSA-OAEP
37da8d8f-42c6-43af-90a9-fd0401eb6c95	af14e02e-ab40-4234-802b-c5f3b901ac34	secret	ABPBSHf2ws_UHImo-FMCbx2abcHPwaJiEtjypiJcNORZHUmkNYVQvK2-VRJlwuwa4YBZlo8IbQkMLWmSunB2-Qgy8mMYEyR1Fe343S9bbZzYeSFELRA4EZM6ui0BVOYj2jAEzcG6G1wWmRKwb82G2fjH6U4KsM7yehOoJ0WXG0s
1cced38e-2717-4b1b-b14a-4450d16690fd	af14e02e-ab40-4234-802b-c5f3b901ac34	kid	3ca4b7c0-0462-467c-9d65-05f5412197bc
69cf89cb-78bd-4499-86fb-c80664e50e6b	af14e02e-ab40-4234-802b-c5f3b901ac34	priority	100
9d70ad7c-ba0f-48ef-8f53-a583ffb1cb04	af14e02e-ab40-4234-802b-c5f3b901ac34	algorithm	HS512
72d3b17b-2127-434c-9cc8-0c2d73a81a24	3fdb4846-4b0c-4aa7-aced-f2652942534f	secret	CgUIbKlZ26-AMczQp88HTQ
a3ecd993-e278-4f68-99e5-ea2b16f3ec3c	3fdb4846-4b0c-4aa7-aced-f2652942534f	kid	b7aadaf4-5451-420e-ad8a-1117014ff5f7
ab089f78-a308-417b-9e79-914c489f47be	3fdb4846-4b0c-4aa7-aced-f2652942534f	priority	100
24d5439c-8ad5-4f59-b187-8a7ca3eccc2d	bdd47a7d-942c-4250-8fbf-c2ecc19fe546	priority	100
490d1772-0d27-4047-b0a2-fce1adf4217e	bdd47a7d-942c-4250-8fbf-c2ecc19fe546	kid	059e7899-2ba5-48b6-94a3-c14d69bb1476
5f4b3ddc-1e7a-4047-a08c-0412d691d481	bdd47a7d-942c-4250-8fbf-c2ecc19fe546	secret	iO-LD_jo1US51HtmaV36WuRAOJHABIWMYPmJ-y7i6-HIrehTj5mpCRU1-J58rKOK5svkr63iWwcZvMWckKccKauVaTGmzF9yUNq3eftESCGNfLOoh9VZe1-gdkeLqdf7J9XxWM7HQBU6nPtjoapaqIQQ5ipmifasYWo2bXE_TpA
7788726e-7014-4b4a-a485-f74570ba9b7c	bdd47a7d-942c-4250-8fbf-c2ecc19fe546	algorithm	HS512
b2bd56d0-9674-4bcb-8bba-243a858e8fdc	0ceee95e-844e-4928-be61-bdabeaab7c3b	certificate	MIICrTCCAZUCBgGVqxnagDANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA90YXNrLWZsb3ctcmVhbG0wHhcNMjUwMzE4MjExMDUzWhcNMzUwMzE4MjExMjMzWjAaMRgwFgYDVQQDDA90YXNrLWZsb3ctcmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCj24CWZv0MHuKh1XRLwrPquJHgQZlX27v2A5VOtOhVPdMUHLRJMDrfzZulQi0/wxpyGe7nODohbqEVkRDoryBErJlrgLCHu+AqCKx3uVjnIjRFKsv9iaUQeD48RXqGjCDBYYyjTnZixe06lfX+IPc5Df9ypW051aTcXfHsVdd9UjtRKjXcy5jerqJ4oTrBHgZakWoDKN0qQb+sQuCjY4r6w4AfKfnpBCIxp9R/MKpGd3nSdUr6Yoel1T0ls2PVziznxw1a1trv3r9gU4+3fkeWZIWWuioqcPxQiw+UiNQfDdkJI2kjlYWVOK0tvNC4Ni1hWnoEHhlsWsjKyXKHr4/lAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIg0o+Z+ECuvL66X12K/tzeo9vXWurLWY6RKdyvYLm7XOFO6dwcO9iDmogCB+14nGDRabe7wMRza9/Qm4lTqeIPjAOISn+H7yd70ul36wZEU0fONyBPWlG28pt8quVkld3RCSr5m8kC9gIsqI3+EhFgBO95jAGz1LAHw6hhP3vz/YKiBoKWiTt56wZCm++ioFKdOgongrY/kPRBrvQfbZ5boaF3h5oq0O1SuBt7pf9j03QvK+V1NkQpy3DDD+XKm3IqZqRG063e+RqxJJkg6WRPwnurNCDVuusTiS+Ub654vv0zdy7RbWPcUMEsibWZgJw+Y2fa2fojYEzxSqshPzqg=
cd3018d3-6503-4d32-83c0-5180f4051add	0ceee95e-844e-4928-be61-bdabeaab7c3b	algorithm	RSA-OAEP
602d56d4-e06f-4a58-a3ab-4ca395d15532	0ceee95e-844e-4928-be61-bdabeaab7c3b	priority	100
c7069088-c7fb-48ee-b23e-2d1c819bd06b	0ceee95e-844e-4928-be61-bdabeaab7c3b	privateKey	MIIEogIBAAKCAQEAo9uAlmb9DB7iodV0S8Kz6riR4EGZV9u79gOVTrToVT3TFBy0STA6382bpUItP8Machnu5zg6IW6hFZEQ6K8gRKyZa4Cwh7vgKgisd7lY5yI0RSrL/YmlEHg+PEV6howgwWGMo052YsXtOpX1/iD3OQ3/cqVtOdWk3F3x7FXXfVI7USo13MuY3q6ieKE6wR4GWpFqAyjdKkG/rELgo2OK+sOAHyn56QQiMafUfzCqRnd50nVK+mKHpdU9JbNj1c4s58cNWtba796/YFOPt35HlmSFlroqKnD8UIsPlIjUHw3ZCSNpI5WFlTitLbzQuDYtYVp6BB4ZbFrIyslyh6+P5QIDAQABAoIBAAWZQCdDbRV/L6iuaasWA747ILbcHvBu0FkLTcxy53ZUJrRq96kBhh10AcOvg2rIkIyCANTzKZ9PT580RfLhWvWlvRc8fiuhGnttMPFlSpmZJFaRrAclbxelOCEokZNr0cmxutOwoGBnGWA1VAKjHzdamFYTO2xstZWW+ydjVnnQabmKihCJsZr1eOkKqb3zuqYy+lQhXJj9NpiQYBmotKRgKVMS0swq3moP0CDdsEhyyRea5BAKwuZruSpullXvAw9CB4QFTM+uug6yR5dsJEJVV2UFZjBJ6YPiWZyAZDr1jzEyBnQInDYWTep94ZtNr6RTQCggCL/qsm3FF0xui9kCgYEAz+qKTKaUtPtnCcxAgVm9bVqWnk72fY7xBRUYceZoD7e9QD5qmYXxEBkPrV3t1Dtxs5r8+/fjUBfFREW3L14n/7FxNyby954FqNWGXjiA7ZB8dmZfGDocUoPMsfYoVRNhSSNqeFbDDhRwF38+B4iU+7dAGyJ6KnDI6lb3gAXwp8kCgYEAycCCocdu+nMIgSZLxUB0DLuKz+vob9uWSQj6gxV9xsN2F7ksr1t7RIVY/uVgUI3byL6Lsio3UFeonQbE7WJRCNrdrfR2IKgSkMq6LsH8Rf2bQ8PbdeTFwIuCNAWN0+tuH7dld5TTH+/Y9hR+1PC3zs0vJq1CFiTuvwuygBgvbT0CgYBidJQM/A0LLsl6MEiTeCVldTJBwO6kQl4LpBOxTAQW/VEW7PeZv32Ju/RailIm4AdVn50QzC/OK5N0Yvb97T5PrH0KOt1vOFtBuespDuSumm71ukBpvorO4C68Tu6Gauj0s1qlpaA0OKVj2xNKifjSwdIPh2IGWuYpYglNjIKLUQKBgDOthwiPgCLQ4mXKfHAbMV6tj0HxCInWcmlkzl5TW/NUz+QFv6dvRGTpz0EDWidoHtsNy9SoMaD3wy3ttPWlUGJ3RX8wdi2pP5AtDYG6mLcI3gN+oLFTF0BZu9E9dvXIgV3IaUo3KdktY6Ks30wGGN70+dXrXVk0vp7bDS74gvV1AoGAZXQR6l+kKjuU+kmGN8/NTHnKLHqUUANzxlF5E7qf4g6mf84evCGuvK3/V5MO4z1Lmm1ueJP30i4Oj28vgVyK/6YJQawazJBaJx9P54X9pz4oJn8QKX39oYEMAnLV8Q/jd1hXy4LsrtKsV+Q+J0v1eiR+w0H8EUn/2i74wcYeh4I=
69d7a87a-821a-48df-83d9-1f1726b9afbe	0ceee95e-844e-4928-be61-bdabeaab7c3b	keyUse	ENC
9d960c51-1944-48a9-acb8-5be3c54cb1f5	c712efd0-7fb0-4d3b-8259-f52ab5f84f06	secret	Tyf5Sbrxr1c5cIxQxVwaOw
20fde7c4-0e75-471f-9979-8e2f52076aed	115a6c2f-9232-41a8-87c4-8f52949de7cd	privateKey	MIIEpAIBAAKCAQEA6oWfBd/djwcgTPhbwgbwBmfsN2TWHahk/p1Mamy5z940r5+8X6fjaA+Oipn+8q1VRu/qTutAhgO8tdOqLG0jKkB6yhneLdkIa/3topsvBJEIzdb0XLwwqqjM+hnnCFDNkA1kk3jqM996/czyllSwE19VeqHYlQ1DNLLkWhizcczzQsdQjHOEvVjJ+P8Z2LDY3okOQy+33YgFCK+7N5U3zVKN8SesgFRReMqWosu2kKTq1Ghd17iuyZ1Bd1SMX+r9ZM0sJ8xrBsx+6ineYgqhcGkOpKsXo0j933i1x3xV7zhXecPXifWSgp9ndpL1hdjH4RvsMxEFWxwXyziyG1OVJQIDAQABAoIBACcsLhGCYOTi1RWeN19rnryHL8jZ5jzac5Im7oxpQEk1DbpXFVUp+x1W2eGTUucwpimc6deISoUIC0WYxxg4G5NTZV8sHnUshxBYwBB02M/rtNuC/9qckYlz/Bb7bCBytL9OyWGrpP0Io2fQy6VqHGYD+shqz70n07Wx+twEu7Zyaj+E2CTFiI34YGs7dt+FHSo54v2Lrh7n6qQg5ovANcVw7zKQFGB/t1sKSb+gfybMCqyxyoChG/AP/0qRodo9ZKo9+i8vFgrhVa5/n7y64TpMoWTnplvms7H5VqaH3ooq8QOjH5KqFX9uafHtQSVhNHO9geBGGonyQZjItxfsrpkCgYEA+wRNY8TcwI3QqPKfwI3ALHC/txAbnuctgdC5IdQE5yScuPI2jiupaw/5+aLVFxZQ5MlQjZtehpc2EfIP8lHJMvcw5KB+3uxvjO2UoPOaHljYBOh5iin0Fow+mNSM304zC3wUN0470g5iLqUImihOB6/5h8lDZWZZ+4IheO4OflkCgYEA7y19dU9UFd3nncrLLcuWIuxclcmoFG9kd9Eg5Pf+f1V1FzUV5O8YLJon5n98q6Sy8qIhw+/FtpWAo4fjlMpfEGnLlEWEjrGaUHm/wYTCNjrgdT7MEaxntaG4ms2uX3JiO/DGFssT5Rl2fbwYw4vudetjAT6Xow21wYAXzhVha60CgYEAo3uC17awO2xheJdEOklX3tmz0wtXod9YgRKqcIDAjLYIqF9/7oo7NfJa0R4fAIFVQBxpLUECiE/VNEzd2+kuS9Y4br6kwpVkdXmKcmUVfCxKzK+H8NcwFLtUTX8pHIq2rgUquXZneYBKq6xqdNRJNbKDps8K6PCHLEntePA6WkkCgYEA0n8IoUvVxwDrLVYjBwTb95Rpz3IQuRtoIoMtHhacJtjBGlGgGUHL1sU9RIEC6dUjoKLMcLL/ILfm5QVdZ7/LdpiFkNK13Re1pgngl6INgsjCbq170DoZdCMGY0eNpXb3uaUn0TudIM4OGI6IhOEMVz94fMnnjpssUUY4rSjn+mkCgYBWMhp73zD12MeFQoXdYMitdlD2BKXMzG9C/pKnF9XZrv4rrXiB4n2bgCK5x96k/heHQ0wBLk9Z5wzj2pk8LsXVQDiBDE5idcZ8VvNW3mbqQz5ijIEQJQdC9uT8zBZmDU+Yok44xptzRkPGAZwuIo9wI/iO/IdjqkljSHOsNrMDOg==
ddce4e3b-ebcc-40b7-a025-563b2572b0ec	115a6c2f-9232-41a8-87c4-8f52949de7cd	keyUse	SIG
c686f4c3-a973-416c-95cc-eff741675a40	115a6c2f-9232-41a8-87c4-8f52949de7cd	certificate	MIICrTCCAZUCBgGVqxnZ5jANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA90YXNrLWZsb3ctcmVhbG0wHhcNMjUwMzE4MjExMDUyWhcNMzUwMzE4MjExMjMyWjAaMRgwFgYDVQQDDA90YXNrLWZsb3ctcmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDqhZ8F392PByBM+FvCBvAGZ+w3ZNYdqGT+nUxqbLnP3jSvn7xfp+NoD46Kmf7yrVVG7+pO60CGA7y106osbSMqQHrKGd4t2Qhr/e2imy8EkQjN1vRcvDCqqMz6GecIUM2QDWSTeOoz33r9zPKWVLATX1V6odiVDUM0suRaGLNxzPNCx1CMc4S9WMn4/xnYsNjeiQ5DL7fdiAUIr7s3lTfNUo3xJ6yAVFF4ypaiy7aQpOrUaF3XuK7JnUF3VIxf6v1kzSwnzGsGzH7qKd5iCqFwaQ6kqxejSP3feLXHfFXvOFd5w9eJ9ZKCn2d2kvWF2MfhG+wzEQVbHBfLOLIbU5UlAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAyp/N72TgjxxslNUhEcxVrOqDnXm2ko315L8kZvfEDDhZUgdyCF23lUX7F9jNcVWqd+u3QfelBzvRAfdGt0SLvGRXwAy/2nMiyuTCy9ekhMeaooeT+xXHFGhor+mZh7Af0Fd40EBUbsL6nevbgga8v/hVy3/GGHZ3pPmjhkrG22ClR52YQwfPi7qwzRe8eGUrOYBfLJvJqh0jzqutfGcbvI/aQ9+eLyElGQRrxCqRo+5I6Sk1+5zehohuOtY3B6Jqed+Yz1DhXZC+N4wyEjJW82VpBbgWRH4xI8zaP+znuarTen6Utm6lvtZgvqkCYG54UZAq4fP24XkmVKE5kPFmo=
82458441-bffb-454e-8432-d3d5bb419e75	1b8eabee-ded0-4a52-9880-6a94931abf2e	host-sending-registration-request-must-match	true
8413c7b0-9c4d-4ffe-8fd3-9d2689208b69	1b8eabee-ded0-4a52-9880-6a94931abf2e	client-uris-must-match	true
229a86b1-61a6-478e-9d15-e308b05d7866	7d87a5c2-ba6c-4604-af4d-1601197326a6	max-clients	200
611b6a90-3ef6-4f73-b270-4d2e9b2d0832	06fa9a9f-f930-4d6c-a367-cd770554ccae	allow-default-scopes	true
8d110abc-6f48-47a8-8a46-d784243fe227	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	oidc-address-mapper
8addae1b-6fda-4351-974f-549fa543f097	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	oidc-full-name-mapper
3f02258c-5a4d-489a-92db-fbbf7087ff01	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	saml-user-property-mapper
17bbbb05-4d60-4cb1-ad3d-b58acc8df2af	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ca7ea2b7-0e57-430b-8e1d-50c0d599365b	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	saml-user-attribute-mapper
335443b1-e852-4e40-87b0-dfab04b67b91	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8472f627-223a-4818-a764-1ebf354d7bfb	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	saml-role-list-mapper
aa23afd4-0846-412f-934b-5e56d4b33374	b341bdcf-6d21-4345-848d-f616be1bd4a2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
88afab37-7148-40b6-b37b-10f8c4a2b138	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	oidc-full-name-mapper
6372c036-7966-47ea-ae6b-1278334a72f2	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	saml-user-property-mapper
5d8fa175-005c-44cf-9c6f-d24256428946	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	saml-role-list-mapper
831a0122-59dd-4247-ac38-1e44aa582247	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f97afe85-d24d-4756-8293-e49a3d97a2df	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	saml-user-attribute-mapper
e2123eb4-3c38-476f-85a6-089e7c02078a	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ce5a2e47-db6d-4cca-90ef-a4d9eba93986	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	oidc-address-mapper
8a6830e4-8821-4744-818c-9f4fa17af584	882177db-4c31-4f9a-9eb3-2b8762d96238	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
dd5b9838-dd91-4381-aaea-f72f5023d2a9	a5fb3600-10b8-414b-ac89-7712f28122f7	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	919b8fcd-82f4-4ed8-b78a-d39765a05679
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	7669028d-f004-4d79-a28d-824b82187eaa
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	d6cd50ba-a269-4756-858a-7de85f698ff0
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	c09191e8-53bb-4549-98b7-0db1ff7bb0ac
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	7d72c098-c3c4-4065-ad86-b2a452e53bfc
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	9d21beea-c0a4-4613-bcc1-909062ad8698
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	0bd3542f-155a-412d-bb11-ed96248ec61a
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	8126152e-e32a-4a9e-8d85-1b4295fd45b2
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	06ada8b5-df3a-4d62-9b4b-700d724a3653
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	62faba3b-f02c-426f-89f1-453c591a26f8
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	5a67b24b-7fb7-4f33-a1b1-1a94dcec7625
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	088158af-3271-4e14-8522-450273617133
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	c67a7332-277d-4400-a3d4-fae92110913e
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	8eb3b9aa-448c-4e8b-8881-cc7b4413744a
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	c8c0cd2e-a60d-48ca-8090-d93291533280
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	f9a505a4-f00c-4110-8c88-725fc513bb8a
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	ec169b55-9b74-4bdf-9c95-7752675290f0
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	6615736a-6efc-40ca-84b8-500a719fa5a8
67bd1f9b-d155-4294-9050-125f9a0ffbf8	0746d948-6e2b-4225-bfa7-f9cb01c9b331
7d72c098-c3c4-4065-ad86-b2a452e53bfc	f9a505a4-f00c-4110-8c88-725fc513bb8a
c09191e8-53bb-4549-98b7-0db1ff7bb0ac	6615736a-6efc-40ca-84b8-500a719fa5a8
c09191e8-53bb-4549-98b7-0db1ff7bb0ac	c8c0cd2e-a60d-48ca-8090-d93291533280
67bd1f9b-d155-4294-9050-125f9a0ffbf8	0c9f5607-fb44-4223-b50f-725f89eb38c7
0c9f5607-fb44-4223-b50f-725f89eb38c7	a94ebb4a-187c-420b-a142-acbbbde8d40f
91fa5393-1260-4ade-bdde-d30d5b02c45a	eadbc825-849c-4714-9d7e-a5c442a83b1d
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	258bec58-0d52-4a98-8401-02d09ab7ea95
67bd1f9b-d155-4294-9050-125f9a0ffbf8	9eae89ed-4f02-46aa-aba3-ced63c1f6dcc
67bd1f9b-d155-4294-9050-125f9a0ffbf8	cf252e0d-f225-47e0-8226-aaac54d21cc3
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	89522d60-cc5e-422a-9d6a-572bbacbfc12
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	5c855f1d-fc24-4718-a94b-5b4a0dde5477
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	38968f11-a379-405e-8026-abae3b374532
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	7c0de6d9-3307-4c5c-a55e-5b3ac3c789e3
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	498b17ba-5fb2-4218-84ef-9264101037cf
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	e1327182-83bf-4942-b8d2-cc227348f981
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	22216ec1-d610-40f0-8068-c64aaea3cb73
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	50f4ca5a-7bd0-43e1-aba8-5870da54acaa
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	c79a6183-a772-4d59-89a8-edd35964c3b2
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	f2f38ce5-a100-44c4-a431-61b867aac39f
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	99415210-5dc2-4995-adcf-51ced5086826
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	665e991b-483c-4d8f-b8f9-f313745c6f89
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	e9562dff-c461-4c7c-bc87-ff9728cf4574
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	cd2e5fa8-85f8-4e23-911b-a5f07cdf1b22
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	4e9c1ba9-8569-4310-95e7-bc2230775968
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	740165d3-4352-446e-a2b2-9377f1b03bb1
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	3a07b872-7444-4bc4-9b66-c0cb80db013b
38968f11-a379-405e-8026-abae3b374532	3a07b872-7444-4bc4-9b66-c0cb80db013b
38968f11-a379-405e-8026-abae3b374532	cd2e5fa8-85f8-4e23-911b-a5f07cdf1b22
7c0de6d9-3307-4c5c-a55e-5b3ac3c789e3	4e9c1ba9-8569-4310-95e7-bc2230775968
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	a16ff434-9869-447e-a0bf-d1274f5426f4
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	9166c90f-64ea-49ad-b13f-338267715d8f
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	8191edbe-3a8c-4401-8e0a-723eefca59c0
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	38df9ae6-c052-472a-8461-05ac5acefa9f
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	7e4d4c17-c88e-4dbd-9b0b-0292b7a1087c
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	420a8597-31e9-45d5-bcbe-cd56f3e13c85
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	50584fc6-a11b-4b97-be85-9841e40f8824
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	3c172085-e86f-4c51-87ad-42a965d34e77
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	8943e9ad-8ba8-4ca1-a5f6-e3ead73ac92f
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	3cb23c59-6a38-457e-8742-5e9735577282
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	99bc9d4b-dad9-4204-9836-30855077ccae
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	428e7e12-f72d-45a2-829d-dbbc799811b2
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	1e53c4b8-457a-4632-b7d3-6fde4edaa716
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	deff7eec-6385-40b1-9fc8-c50a527b3392
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	2debc896-bcd0-496f-8f21-390cfa6d058f
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	b410ba25-839f-4176-8396-9e51eeabdf29
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	b58a2cc7-db46-4797-843d-98f7d879ed8b
38df9ae6-c052-472a-8461-05ac5acefa9f	2debc896-bcd0-496f-8f21-390cfa6d058f
8191edbe-3a8c-4401-8e0a-723eefca59c0	b58a2cc7-db46-4797-843d-98f7d879ed8b
8191edbe-3a8c-4401-8e0a-723eefca59c0	deff7eec-6385-40b1-9fc8-c50a527b3392
d1505096-51ce-4d3c-86ea-ded36a7aa46d	dd8fa9a1-51f6-4e91-bd1f-e6a4f63feef8
d1505096-51ce-4d3c-86ea-ded36a7aa46d	a0524e3a-68b3-4ef7-a063-d837968b7884
a0524e3a-68b3-4ef7-a063-d837968b7884	fa3c4a8c-0546-4460-913b-e6846964fc57
56e95979-a217-49e9-b135-c96c3a6026c3	b23c53fd-4d61-4fe0-add7-23cad7953b4a
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	f6343add-4d06-4881-9cf6-dfba06e17a4b
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	d8a170c2-5a8e-442a-b6c0-c3342858206c
d1505096-51ce-4d3c-86ea-ded36a7aa46d	e263c424-b27d-4071-bf97-82fbb2c786e8
d1505096-51ce-4d3c-86ea-ded36a7aa46d	c5584390-40bc-4545-a6ed-ff79398a4feb
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
502fa626-948a-40a0-9d0d-32281d317ae4	\N	password	bb4edd25-3fe3-49ee-9b9c-5b33edd67576	1742332300841	\N	{"value":"W2CIAOChREG34PjPyELE0JkL8jAfs+c5OWHUNsOiCiU=","salt":"CMQGjrM3vzxB/VujNfTzrA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
dd5efcce-3ed7-4a12-9386-cf7769ddabf4	\N	password	e41d3fde-0e87-498b-8efc-3d0ef2c6b0c9	1742332492532	My password	{"value":"qE2pzSNY5kL7XsYDpKfDx2mQMUpgrVUxYXG1M/ZM3rc=","salt":"/kHbfo5I/tVuIUsw2xCAmw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-03-18 21:11:06.280383	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	2332264740
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-03-18 21:11:06.328141	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	2332264740
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-03-18 21:11:06.466815	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	2332264740
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-03-18 21:11:06.485975	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2332264740
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-03-18 21:11:06.820752	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	2332264740
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-03-18 21:11:06.841802	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	2332264740
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-03-18 21:11:07.503201	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	2332264740
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-03-18 21:11:07.519088	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	2332264740
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-03-18 21:11:07.537566	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	2332264740
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-03-18 21:11:07.845434	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	2332264740
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-03-18 21:11:08.016423	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2332264740
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-03-18 21:11:08.030267	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2332264740
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-03-18 21:11:08.082612	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2332264740
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-03-18 21:11:08.161798	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	2332264740
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-03-18 21:11:08.167908	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-03-18 21:11:08.178428	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	2332264740
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-03-18 21:11:08.192002	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	2332264740
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-03-18 21:11:08.313563	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	2332264740
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-03-18 21:11:08.440193	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	2332264740
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-03-18 21:11:08.460662	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	2332264740
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-03-18 21:11:08.469489	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	2332264740
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-03-18 21:11:08.477884	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	2332264740
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-03-18 21:11:08.667753	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	2332264740
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-03-18 21:11:08.680496	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	2332264740
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-03-18 21:11:08.685637	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	2332264740
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-03-18 21:11:10.522062	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	2332264740
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-03-18 21:11:10.870111	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	2332264740
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-03-18 21:11:10.889922	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	2332264740
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-03-18 21:11:11.196009	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	2332264740
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-03-18 21:11:11.286252	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	2332264740
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-03-18 21:11:11.432704	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	2332264740
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-03-18 21:11:11.453453	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	2332264740
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-03-18 21:11:11.484741	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-03-18 21:11:11.509199	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	2332264740
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-03-18 21:11:11.696042	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	2332264740
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-03-18 21:11:11.73171	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	2332264740
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-03-18 21:11:11.767053	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2332264740
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-03-18 21:11:11.790799	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	2332264740
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-03-18 21:11:11.817182	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	2332264740
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-03-18 21:11:11.826769	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	2332264740
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-03-18 21:11:11.845062	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	2332264740
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-03-18 21:11:11.887771	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	2332264740
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-03-18 21:11:19.811977	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	2332264740
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-03-18 21:11:19.835748	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	2332264740
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-03-18 21:11:19.857508	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	2332264740
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-03-18 21:11:19.874944	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	2332264740
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-03-18 21:11:19.882626	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	2332264740
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-03-18 21:11:20.222143	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	2332264740
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-03-18 21:11:20.232919	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	2332264740
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-03-18 21:11:20.351073	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	2332264740
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-03-18 21:11:21.272477	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	2332264740
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-03-18 21:11:21.295427	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-03-18 21:11:21.306573	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	2332264740
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-03-18 21:11:21.317104	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	2332264740
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-03-18 21:11:21.338523	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	2332264740
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-03-18 21:11:21.352167	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	2332264740
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-03-18 21:11:21.653174	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	2332264740
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-03-18 21:11:24.898847	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	2332264740
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-03-18 21:11:25.008706	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	2332264740
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-03-18 21:11:25.032105	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	2332264740
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-03-18 21:11:25.064828	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	2332264740
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-03-18 21:11:25.085857	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	2332264740
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-03-18 21:11:25.098737	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	2332264740
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-03-18 21:11:25.113068	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	2332264740
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-03-18 21:11:25.125796	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	2332264740
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-03-18 21:11:25.43345	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	2332264740
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-03-18 21:11:25.811609	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	2332264740
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-03-18 21:11:25.831446	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	2332264740
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-03-18 21:11:26.314981	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	2332264740
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-03-18 21:11:26.364415	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	2332264740
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-03-18 21:11:26.392522	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	2332264740
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-03-18 21:11:26.475119	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2332264740
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-03-18 21:11:26.531266	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2332264740
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-03-18 21:11:26.564721	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2332264740
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-03-18 21:11:26.85271	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	2332264740
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-03-18 21:11:27.340193	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	2332264740
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-03-18 21:11:27.359269	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	2332264740
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-03-18 21:11:27.365394	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	2332264740
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-03-18 21:11:27.852087	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	2332264740
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-03-18 21:11:27.857596	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	2332264740
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-03-18 21:11:28.256007	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	2332264740
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-03-18 21:11:28.26548	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2332264740
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-03-18 21:11:28.310859	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2332264740
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-03-18 21:11:28.31773	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2332264740
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-03-18 21:11:28.779139	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2332264740
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-03-18 21:11:28.798119	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	2332264740
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-03-18 21:11:28.833731	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	2332264740
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-03-18 21:11:28.87473	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	2332264740
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:28.89774	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	2332264740
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:28.917939	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	2332264740
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.41879	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.446414	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	2332264740
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.451726	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	2332264740
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.476246	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	2332264740
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.481766	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	2332264740
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-03-18 21:11:29.495631	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	2332264740
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.683358	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.68881	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.717841	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.819442	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.825814	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.9125	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	2332264740
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-03-18 21:11:29.924804	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	2332264740
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-03-18 21:11:29.942832	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	2332264740
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-03-18 21:11:30.030044	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	2332264740
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-03-18 21:11:30.115635	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	2332264740
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-03-18 21:11:30.223615	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	2332264740
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-03-18 21:11:30.235714	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	2332264740
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-03-18 21:11:30.348307	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	2332264740
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-03-18 21:11:30.354626	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	2332264740
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-03-18 21:11:30.373808	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-03-18 21:11:30.383329	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	2332264740
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-03-18 21:11:30.477832	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	2332264740
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-03-18 21:11:30.486989	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	2332264740
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-03-18 21:11:30.499835	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	2332264740
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-03-18 21:11:30.510018	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	2332264740
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-03-18 21:11:30.541285	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	2332264740
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-03-18 21:11:30.560763	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2332264740
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-03-18 21:11:30.931827	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	2332264740
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-03-18 21:11:30.943297	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	2332264740
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-03-18 21:11:30.959183	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-03-18 21:11:31.035933	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-03-18 21:11:31.046761	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	2332264740
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-03-18 21:11:31.055018	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-03-18 21:11:31.063746	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:31.079596	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:31.38333	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:31.840842	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:31.977885	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.163284	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.487874	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.501764	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.741588	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2332264740
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.825977	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	2332264740
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.869115	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	2332264740
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:32.876413	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	2332264740
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-03-18 21:11:33.110965	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	2332264740
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.133974	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	2332264740
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.150936	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	2332264740
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.227604	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	2332264740
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.241321	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	2332264740
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.261634	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	2332264740
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.33392	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	2332264740
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.459726	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	2332264740
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.536967	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	2332264740
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.558454	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	2332264740
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-03-18 21:11:33.568661	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	2332264740
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-03-18 21:11:33.616407	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	2332264740
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-03-18 21:11:33.658312	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	2332264740
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-03-18 21:11:33.670991	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	2332264740
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
1739fb5b-3e74-44ff-bfea-37693723158e	d6cb07ab-4951-45fc-88ed-ed46b63dd316	f
1739fb5b-3e74-44ff-bfea-37693723158e	d0e40d61-1c99-4404-bb13-704061d4f54b	t
1739fb5b-3e74-44ff-bfea-37693723158e	f4901175-2040-4d5f-8b64-06299d7a10c1	t
1739fb5b-3e74-44ff-bfea-37693723158e	9acccff7-1e16-442f-81f1-857b74c75505	t
1739fb5b-3e74-44ff-bfea-37693723158e	b84e4c21-a69d-44d1-a18d-c4474ff52e2a	t
1739fb5b-3e74-44ff-bfea-37693723158e	3b47e6fc-2020-4e11-9f53-1730bcabaa08	f
1739fb5b-3e74-44ff-bfea-37693723158e	f80c2fc2-3e39-4496-bae6-cd753cb27f2c	f
1739fb5b-3e74-44ff-bfea-37693723158e	76c46171-152e-4a41-8aca-92b8ae9cace9	t
1739fb5b-3e74-44ff-bfea-37693723158e	a2d2b413-9234-48c9-8ece-107cfd8886ca	t
1739fb5b-3e74-44ff-bfea-37693723158e	aa569179-8629-4041-a8cd-0e5724155825	f
1739fb5b-3e74-44ff-bfea-37693723158e	0acc2d70-d6f4-4b43-8443-404bd99ca433	t
1739fb5b-3e74-44ff-bfea-37693723158e	38db5036-1332-40ad-b8ba-f9943cd8a9e1	t
1739fb5b-3e74-44ff-bfea-37693723158e	37a83e85-767e-4291-a7c7-697adc4d5094	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	2a980725-e7d1-438d-b2c4-d17ecfd44408	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0748e898-feb5-44a7-a24a-17cf96458a6a	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	1ed86071-c2a2-45e1-aa65-5549fcc4516d	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	e767937a-a2bf-40c8-8c0b-a8c2205b89ba	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	3edd5931-a614-40d3-8d9e-b1efec6e5082	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	3764dde0-7038-47a4-853d-284b0d8e7ca6	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ff1512a3-e8ab-4b99-9711-8791bbdb60a6	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	7f05a2cc-feb2-4799-90da-be7f09e042e3	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	c84fcbfe-7493-43aa-83f3-cc865f5f7a11	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	3f94be48-e9b8-40cf-a4f5-00575d1acf52	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	32c2c35c-2d16-4ffa-beb5-a08c59328528	t
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f401c331-5a27-4523-867c-c52a5d7781ec	f
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	51bf50af-846c-4786-a531-47422cb243d9	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
1d60a318-de73-4278-97b0-7a043abff8e9	6a0d6928-19c9-4ba5-8791-a2412c90fb32
2ad5b2b0-4137-4e42-8af5-df8b215fadb8	6a0d6928-19c9-4ba5-8791-a2412c90fb32
1d60a318-de73-4278-97b0-7a043abff8e9	f91bbd76-551f-46ab-8e2b-f3584fd1725b
2ad5b2b0-4137-4e42-8af5-df8b215fadb8	f91bbd76-551f-46ab-8e2b-f3584fd1725b
e95b2cdf-0a74-48d4-8d20-f2f2f6de759c	f91bbd76-551f-46ab-8e2b-f3584fd1725b
5962c687-7906-47db-9aa6-ce37d2d7f84c	f91bbd76-551f-46ab-8e2b-f3584fd1725b
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
6a0d6928-19c9-4ba5-8791-a2412c90fb32	developers	 	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0
f91bbd76-551f-46ab-8e2b-f3584fd1725b	managers	 	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
67bd1f9b-d155-4294-9050-125f9a0ffbf8	1739fb5b-3e74-44ff-bfea-37693723158e	f	${role_default-roles}	default-roles-master	1739fb5b-3e74-44ff-bfea-37693723158e	\N	\N
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	1739fb5b-3e74-44ff-bfea-37693723158e	f	${role_admin}	admin	1739fb5b-3e74-44ff-bfea-37693723158e	\N	\N
919b8fcd-82f4-4ed8-b78a-d39765a05679	1739fb5b-3e74-44ff-bfea-37693723158e	f	${role_create-realm}	create-realm	1739fb5b-3e74-44ff-bfea-37693723158e	\N	\N
7669028d-f004-4d79-a28d-824b82187eaa	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_create-client}	create-client	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
d6cd50ba-a269-4756-858a-7de85f698ff0	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-realm}	view-realm	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
c09191e8-53bb-4549-98b7-0db1ff7bb0ac	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-users}	view-users	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
7d72c098-c3c4-4065-ad86-b2a452e53bfc	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-clients}	view-clients	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
9d21beea-c0a4-4613-bcc1-909062ad8698	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-events}	view-events	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
0bd3542f-155a-412d-bb11-ed96248ec61a	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-identity-providers}	view-identity-providers	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
8126152e-e32a-4a9e-8d85-1b4295fd45b2	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_view-authorization}	view-authorization	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
06ada8b5-df3a-4d62-9b4b-700d724a3653	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-realm}	manage-realm	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
62faba3b-f02c-426f-89f1-453c591a26f8	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-users}	manage-users	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
5a67b24b-7fb7-4f33-a1b1-1a94dcec7625	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-clients}	manage-clients	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
088158af-3271-4e14-8522-450273617133	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-events}	manage-events	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
c67a7332-277d-4400-a3d4-fae92110913e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-identity-providers}	manage-identity-providers	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
8eb3b9aa-448c-4e8b-8881-cc7b4413744a	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_manage-authorization}	manage-authorization	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
c8c0cd2e-a60d-48ca-8090-d93291533280	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_query-users}	query-users	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
f9a505a4-f00c-4110-8c88-725fc513bb8a	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_query-clients}	query-clients	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
ec169b55-9b74-4bdf-9c95-7752675290f0	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_query-realms}	query-realms	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
6615736a-6efc-40ca-84b8-500a719fa5a8	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_query-groups}	query-groups	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
0746d948-6e2b-4225-bfa7-f9cb01c9b331	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_view-profile}	view-profile	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
0c9f5607-fb44-4223-b50f-725f89eb38c7	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_manage-account}	manage-account	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
a94ebb4a-187c-420b-a142-acbbbde8d40f	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_manage-account-links}	manage-account-links	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
4fd4e491-a951-4c83-9fc2-ea6cd7fbd8e2	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_view-applications}	view-applications	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
eadbc825-849c-4714-9d7e-a5c442a83b1d	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_view-consent}	view-consent	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
91fa5393-1260-4ade-bdde-d30d5b02c45a	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_manage-consent}	manage-consent	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
a7878adc-a11c-4241-959d-9cac566f61a5	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_view-groups}	view-groups	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
b3a76c46-b2a2-4630-ae5f-d1406f40df85	38a5e274-e55b-45aa-87b0-c41c8443e5c5	t	${role_delete-account}	delete-account	1739fb5b-3e74-44ff-bfea-37693723158e	38a5e274-e55b-45aa-87b0-c41c8443e5c5	\N
a869f27f-8479-479f-913a-e4152435e534	e4e17d84-b458-4a43-8311-1a6a19d62b16	t	${role_read-token}	read-token	1739fb5b-3e74-44ff-bfea-37693723158e	e4e17d84-b458-4a43-8311-1a6a19d62b16	\N
258bec58-0d52-4a98-8401-02d09ab7ea95	0001e805-bf98-463b-a5bc-5d45e9cf9d51	t	${role_impersonation}	impersonation	1739fb5b-3e74-44ff-bfea-37693723158e	0001e805-bf98-463b-a5bc-5d45e9cf9d51	\N
9eae89ed-4f02-46aa-aba3-ced63c1f6dcc	1739fb5b-3e74-44ff-bfea-37693723158e	f	${role_offline-access}	offline_access	1739fb5b-3e74-44ff-bfea-37693723158e	\N	\N
cf252e0d-f225-47e0-8226-aaac54d21cc3	1739fb5b-3e74-44ff-bfea-37693723158e	f	${role_uma_authorization}	uma_authorization	1739fb5b-3e74-44ff-bfea-37693723158e	\N	\N
d1505096-51ce-4d3c-86ea-ded36a7aa46d	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f	${role_default-roles}	default-roles-task-flow-realm	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N	\N
89522d60-cc5e-422a-9d6a-572bbacbfc12	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_create-client}	create-client	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
5c855f1d-fc24-4718-a94b-5b4a0dde5477	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-realm}	view-realm	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
38968f11-a379-405e-8026-abae3b374532	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-users}	view-users	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
7c0de6d9-3307-4c5c-a55e-5b3ac3c789e3	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-clients}	view-clients	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
498b17ba-5fb2-4218-84ef-9264101037cf	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-events}	view-events	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
e1327182-83bf-4942-b8d2-cc227348f981	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-identity-providers}	view-identity-providers	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
22216ec1-d610-40f0-8068-c64aaea3cb73	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_view-authorization}	view-authorization	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
50f4ca5a-7bd0-43e1-aba8-5870da54acaa	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-realm}	manage-realm	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
c79a6183-a772-4d59-89a8-edd35964c3b2	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-users}	manage-users	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
f2f38ce5-a100-44c4-a431-61b867aac39f	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-clients}	manage-clients	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
99415210-5dc2-4995-adcf-51ced5086826	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-events}	manage-events	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
665e991b-483c-4d8f-b8f9-f313745c6f89	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-identity-providers}	manage-identity-providers	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
e9562dff-c461-4c7c-bc87-ff9728cf4574	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_manage-authorization}	manage-authorization	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
cd2e5fa8-85f8-4e23-911b-a5f07cdf1b22	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_query-users}	query-users	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
4e9c1ba9-8569-4310-95e7-bc2230775968	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_query-clients}	query-clients	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
740165d3-4352-446e-a2b2-9377f1b03bb1	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_query-realms}	query-realms	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
3a07b872-7444-4bc4-9b66-c0cb80db013b	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_query-groups}	query-groups	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
6dfcc80d-4b28-45e1-aec6-e01fbb6df6fb	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_realm-admin}	realm-admin	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
a16ff434-9869-447e-a0bf-d1274f5426f4	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_create-client}	create-client	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
9166c90f-64ea-49ad-b13f-338267715d8f	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-realm}	view-realm	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
8191edbe-3a8c-4401-8e0a-723eefca59c0	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-users}	view-users	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
38df9ae6-c052-472a-8461-05ac5acefa9f	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-clients}	view-clients	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
7e4d4c17-c88e-4dbd-9b0b-0292b7a1087c	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-events}	view-events	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
420a8597-31e9-45d5-bcbe-cd56f3e13c85	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-identity-providers}	view-identity-providers	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
50584fc6-a11b-4b97-be85-9841e40f8824	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_view-authorization}	view-authorization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
3c172085-e86f-4c51-87ad-42a965d34e77	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-realm}	manage-realm	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
8943e9ad-8ba8-4ca1-a5f6-e3ead73ac92f	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-users}	manage-users	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
3cb23c59-6a38-457e-8742-5e9735577282	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-clients}	manage-clients	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
99bc9d4b-dad9-4204-9836-30855077ccae	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-events}	manage-events	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
428e7e12-f72d-45a2-829d-dbbc799811b2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-identity-providers}	manage-identity-providers	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
1e53c4b8-457a-4632-b7d3-6fde4edaa716	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_manage-authorization}	manage-authorization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
deff7eec-6385-40b1-9fc8-c50a527b3392	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_query-users}	query-users	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
2debc896-bcd0-496f-8f21-390cfa6d058f	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_query-clients}	query-clients	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
b410ba25-839f-4176-8396-9e51eeabdf29	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_query-realms}	query-realms	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
b58a2cc7-db46-4797-843d-98f7d879ed8b	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_query-groups}	query-groups	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
dd8fa9a1-51f6-4e91-bd1f-e6a4f63feef8	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_view-profile}	view-profile	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
a0524e3a-68b3-4ef7-a063-d837968b7884	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_manage-account}	manage-account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
fa3c4a8c-0546-4460-913b-e6846964fc57	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_manage-account-links}	manage-account-links	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
70f1061b-2d5b-4ecd-a9ed-445752aa1a9f	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_view-applications}	view-applications	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
b23c53fd-4d61-4fe0-add7-23cad7953b4a	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_view-consent}	view-consent	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
56e95979-a217-49e9-b135-c96c3a6026c3	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_manage-consent}	manage-consent	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
1a42e6a0-7bbc-43d8-960c-b3a4dcc50b8e	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_view-groups}	view-groups	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
6e333930-adef-4635-bce0-7aaa9455bd91	4fc86ede-2848-4493-bc3e-b175c51fcf68	t	${role_delete-account}	delete-account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	4fc86ede-2848-4493-bc3e-b175c51fcf68	\N
f6343add-4d06-4881-9cf6-dfba06e17a4b	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	t	${role_impersonation}	impersonation	1739fb5b-3e74-44ff-bfea-37693723158e	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	\N
d8a170c2-5a8e-442a-b6c0-c3342858206c	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	t	${role_impersonation}	impersonation	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0fa9a253-f928-44f4-96b7-a3ed2fd69ccf	\N
aeefdcc4-c96a-42d9-bb84-b745c86a55a3	5131c547-ba20-4a29-aef1-0d745a8a1ab1	t	${role_read-token}	read-token	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5131c547-ba20-4a29-aef1-0d745a8a1ab1	\N
e263c424-b27d-4071-bf97-82fbb2c786e8	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f	${role_offline-access}	offline_access	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N	\N
c5584390-40bc-4545-a6ed-ff79398a4feb	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f	${role_uma_authorization}	uma_authorization	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	\N	\N
1d60a318-de73-4278-97b0-7a043abff8e9	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	t		read_task	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	\N
e95b2cdf-0a74-48d4-8d20-f2f2f6de759c	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	t		create_task	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	\N
2ad5b2b0-4137-4e42-8af5-df8b215fadb8	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	t		update_task	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	\N
5962c687-7906-47db-9aa6-ce37d2d7f84c	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	t		delete_task	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	6b0c849d-86ba-4ea4-90af-2d17c1c8314f	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
93a9h	26.1.3	1742332295
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
aaa2ee06-69fd-4b87-a813-c234f2525eac	5081130b-b692-4acc-8759-2504425efa0a	0	1742556964	{"authMethod":"openid-connect","redirectUri":"http://localhost:5002/swagger/oauth2-redirect.html","notes":{"clientId":"5081130b-b692-4acc-8759-2504425efa0a","scope":"openid profile","userSessionStartedAt":"1742556964","iss":"http://localhost:5001/realms/task-flow-realm","startedAt":"1742556964","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","redirect_uri":"http://localhost:5002/swagger/oauth2-redirect.html","state":"RnJpIE1hciAyMSAyMDI1IDE0OjM1OjU1IEdNVCswMzAwICjQnNC+0YHQutCy0LAsINGB0YLQsNC90LTQsNGA0YLQvdC+0LUg0LLRgNC10LzRjyk=","code_challenge":"i7XFEzkvukSjJ19l9h5Mv33bew79cg4gG7y5YiHprTc"}}	local	local	0
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
aaa2ee06-69fd-4b87-a813-c234f2525eac	e41d3fde-0e87-498b-8efc-3d0ef2c6b0c9	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	1742556964	0	{"ipAddress":"172.18.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTguMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzNC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1742556964","authenticators-completed":"{\\"59814ff9-7d1a-479d-95b8-8f33e7d308d6\\":1742556964}"},"state":"LOGGED_IN"}	1742556964	\N	0
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
11c63a63-806c-4969-9bcf-6b81756bca20	audience resolve	openid-connect	oidc-audience-resolve-mapper	d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	\N
ea2c1139-1c7c-4921-88de-1f3c05df0195	locale	openid-connect	oidc-usermodel-attribute-mapper	74033654-fcf1-4ebe-877d-25e96dcdd914	\N
bb47537f-33bf-405e-9cb1-2e11c7a465e7	role list	saml	saml-role-list-mapper	\N	d0e40d61-1c99-4404-bb13-704061d4f54b
3c14b192-9bb6-4401-9460-dc83f4e6a036	organization	saml	saml-organization-membership-mapper	\N	f4901175-2040-4d5f-8b64-06299d7a10c1
a7551288-3063-4d2e-bac4-97bf3f586b56	full name	openid-connect	oidc-full-name-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
e6388e96-cf40-430c-8498-12747ad456b3	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
3d190a6e-daad-4576-8818-cbf7cd21991d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
3c61dc24-8462-4541-b63c-82828f694d21	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
cdafaa1c-12dd-46c1-960a-e3530d10a083	username	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
973ab577-2cb7-4a20-a361-38b7b64f20e9	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
c73f08bd-f010-4984-a799-1035e611c77c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
b1591c7f-c137-4b58-81c1-89e5a6814eea	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
42df4bb0-89d1-4280-8d39-dca06803f4cd	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
fe84f474-5d72-47bf-a678-aa00ec8da04d	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
fe39a38f-d44f-4931-b379-7e8e4080e0b7	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
ca7d681c-9592-4704-a166-4cb56a86ca66	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	9acccff7-1e16-442f-81f1-857b74c75505
aeee59ab-e607-4893-b42d-1f1e91dccbca	email	openid-connect	oidc-usermodel-attribute-mapper	\N	b84e4c21-a69d-44d1-a18d-c4474ff52e2a
12484cfa-b681-4e28-8c03-fe88da15b68b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b84e4c21-a69d-44d1-a18d-c4474ff52e2a
efdec5a3-e9f4-4b7b-a161-0f8934bac486	address	openid-connect	oidc-address-mapper	\N	3b47e6fc-2020-4e11-9f53-1730bcabaa08
d1bd7b19-6471-48aa-9b85-f7c04d356799	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f80c2fc2-3e39-4496-bae6-cd753cb27f2c
e1af8c03-d74f-462c-a91e-dc3d1272120c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f80c2fc2-3e39-4496-bae6-cd753cb27f2c
cc71d474-cabf-403f-bff9-ba39edd0a370	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	76c46171-152e-4a41-8aca-92b8ae9cace9
9446c2d9-8952-44a3-8d21-96bc903ccdf8	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	76c46171-152e-4a41-8aca-92b8ae9cace9
05e564b7-dcb8-456a-a662-974dd96a4562	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	76c46171-152e-4a41-8aca-92b8ae9cace9
13d96587-6855-4c81-80ad-93fd7f424d26	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	a2d2b413-9234-48c9-8ece-107cfd8886ca
113a4d3b-c8eb-4edf-ab81-a53733c985be	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	aa569179-8629-4041-a8cd-0e5724155825
6496fb33-61bb-466f-9541-65c4e719ca11	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	aa569179-8629-4041-a8cd-0e5724155825
4dfec03c-a91d-4379-9741-15ba47571476	acr loa level	openid-connect	oidc-acr-mapper	\N	0acc2d70-d6f4-4b43-8443-404bd99ca433
da432308-5849-4ea6-a70e-cd850981e950	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	38db5036-1332-40ad-b8ba-f9943cd8a9e1
54f1d240-78da-4ab0-a8a5-01e7b3dfeaf9	sub	openid-connect	oidc-sub-mapper	\N	38db5036-1332-40ad-b8ba-f9943cd8a9e1
7752c37f-8640-4905-bfdb-48fa97c8892d	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	8459a282-300e-4fd3-817f-539b0aec368c
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	8459a282-300e-4fd3-817f-539b0aec368c
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	8459a282-300e-4fd3-817f-539b0aec368c
4739787e-6483-4d61-92e8-826276d62e71	organization	openid-connect	oidc-organization-membership-mapper	\N	37a83e85-767e-4291-a7c7-697adc4d5094
833c0257-0135-4a48-b801-df43fa157185	audience resolve	openid-connect	oidc-audience-resolve-mapper	9a245b58-a810-42c8-a40e-f65528d330b3	\N
1a194bfd-4376-40bf-b765-1af6d5c4cde0	role list	saml	saml-role-list-mapper	\N	0748e898-feb5-44a7-a24a-17cf96458a6a
8f8790f3-b6d7-4ebd-9372-dc8d7af3eebc	organization	saml	saml-organization-membership-mapper	\N	1ed86071-c2a2-45e1-aa65-5549fcc4516d
08d6c890-1200-4db6-ac7c-d4995a38394f	full name	openid-connect	oidc-full-name-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
f1519d05-e704-40f5-ba7e-384bd471311b	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
4a48aed1-824c-48b3-9a18-b49001b91962	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
d0c8a178-8723-40d0-8202-fe43ba06c3cc	username	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
4e25a4aa-9463-4635-84de-db5e174c7157	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
161c5c1d-a993-4eea-8ba7-6048aacca372	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
476e109d-dcec-4235-aa72-4301b2b0f9a8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
e4034110-5186-422d-9a57-2bdcb8be8298	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
a6c1f7c0-a10a-44f7-8930-68aa9145d899	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
368c6b62-6e4f-497b-bdbc-58f761194c21	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
1da1cce5-2793-46b7-a65c-9717abb4b5f5	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e767937a-a2bf-40c8-8c0b-a8c2205b89ba
b5eb9211-b02f-43b8-8237-6dda67330da3	email	openid-connect	oidc-usermodel-attribute-mapper	\N	3edd5931-a614-40d3-8d9e-b1efec6e5082
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3edd5931-a614-40d3-8d9e-b1efec6e5082
e451c205-1bdc-482c-b034-d8f322497e29	address	openid-connect	oidc-address-mapper	\N	3764dde0-7038-47a4-853d-284b0d8e7ca6
ca401663-f7ac-4b66-b1ec-97a3e7866241	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e
8ce1f652-8f8e-400e-842b-b3942780ed44	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	01bb6cd8-a8a2-4584-ad2e-8f1a5130ee7e
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ff1512a3-e8ab-4b99-9711-8791bbdb60a6
25e47ae2-5d86-4037-b832-d4b0316417c5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ff1512a3-e8ab-4b99-9711-8791bbdb60a6
6836d202-a182-4b02-8a15-f41731f04414	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ff1512a3-e8ab-4b99-9711-8791bbdb60a6
d8aadda8-c2cc-4b99-8252-3488c9930e7b	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7f05a2cc-feb2-4799-90da-be7f09e042e3
f16159ac-9617-4d8f-9c1c-655f142a705a	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	c84fcbfe-7493-43aa-83f3-cc865f5f7a11
1bae6ae9-548c-43a6-8192-41bfb54f27a0	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	c84fcbfe-7493-43aa-83f3-cc865f5f7a11
9cee18b6-27d6-4099-99e3-38a89a84316f	acr loa level	openid-connect	oidc-acr-mapper	\N	3f94be48-e9b8-40cf-a4f5-00575d1acf52
f9e485f1-5287-4af9-918c-50b28ef62ded	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	32c2c35c-2d16-4ffa-beb5-a08c59328528
1a71ea94-e76f-4166-a660-99cce882c27a	sub	openid-connect	oidc-sub-mapper	\N	32c2c35c-2d16-4ffa-beb5-a08c59328528
d6035e29-39c5-4d64-ad38-b932ffd76102	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	b6c78390-46de-48e5-873c-12a84099dc40
056b968d-996d-4382-b3b7-cd2562758928	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	b6c78390-46de-48e5-873c-12a84099dc40
03239846-eb1e-423a-b4ef-5e533f4fa99b	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	b6c78390-46de-48e5-873c-12a84099dc40
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	organization	openid-connect	oidc-organization-membership-mapper	\N	f401c331-5a27-4523-867c-c52a5d7781ec
52f4954a-5821-4f24-901d-597d7dae6266	locale	openid-connect	oidc-usermodel-attribute-mapper	33909007-b1ae-48f2-b4e4-86cd51b4c359	\N
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	tasks-api-audience-mapper	openid-connect	oidc-audience-mapper	\N	51bf50af-846c-4786-a531-47422cb243d9
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
ea2c1139-1c7c-4921-88de-1f3c05df0195	true	introspection.token.claim
ea2c1139-1c7c-4921-88de-1f3c05df0195	true	userinfo.token.claim
ea2c1139-1c7c-4921-88de-1f3c05df0195	locale	user.attribute
ea2c1139-1c7c-4921-88de-1f3c05df0195	true	id.token.claim
ea2c1139-1c7c-4921-88de-1f3c05df0195	true	access.token.claim
ea2c1139-1c7c-4921-88de-1f3c05df0195	locale	claim.name
ea2c1139-1c7c-4921-88de-1f3c05df0195	String	jsonType.label
bb47537f-33bf-405e-9cb1-2e11c7a465e7	false	single
bb47537f-33bf-405e-9cb1-2e11c7a465e7	Basic	attribute.nameformat
bb47537f-33bf-405e-9cb1-2e11c7a465e7	Role	attribute.name
3c61dc24-8462-4541-b63c-82828f694d21	true	introspection.token.claim
3c61dc24-8462-4541-b63c-82828f694d21	true	userinfo.token.claim
3c61dc24-8462-4541-b63c-82828f694d21	nickname	user.attribute
3c61dc24-8462-4541-b63c-82828f694d21	true	id.token.claim
3c61dc24-8462-4541-b63c-82828f694d21	true	access.token.claim
3c61dc24-8462-4541-b63c-82828f694d21	nickname	claim.name
3c61dc24-8462-4541-b63c-82828f694d21	String	jsonType.label
3d190a6e-daad-4576-8818-cbf7cd21991d	true	introspection.token.claim
3d190a6e-daad-4576-8818-cbf7cd21991d	true	userinfo.token.claim
3d190a6e-daad-4576-8818-cbf7cd21991d	middleName	user.attribute
3d190a6e-daad-4576-8818-cbf7cd21991d	true	id.token.claim
3d190a6e-daad-4576-8818-cbf7cd21991d	true	access.token.claim
3d190a6e-daad-4576-8818-cbf7cd21991d	middle_name	claim.name
3d190a6e-daad-4576-8818-cbf7cd21991d	String	jsonType.label
42df4bb0-89d1-4280-8d39-dca06803f4cd	true	introspection.token.claim
42df4bb0-89d1-4280-8d39-dca06803f4cd	true	userinfo.token.claim
42df4bb0-89d1-4280-8d39-dca06803f4cd	birthdate	user.attribute
42df4bb0-89d1-4280-8d39-dca06803f4cd	true	id.token.claim
42df4bb0-89d1-4280-8d39-dca06803f4cd	true	access.token.claim
42df4bb0-89d1-4280-8d39-dca06803f4cd	birthdate	claim.name
42df4bb0-89d1-4280-8d39-dca06803f4cd	String	jsonType.label
973ab577-2cb7-4a20-a361-38b7b64f20e9	true	introspection.token.claim
973ab577-2cb7-4a20-a361-38b7b64f20e9	true	userinfo.token.claim
973ab577-2cb7-4a20-a361-38b7b64f20e9	profile	user.attribute
973ab577-2cb7-4a20-a361-38b7b64f20e9	true	id.token.claim
973ab577-2cb7-4a20-a361-38b7b64f20e9	true	access.token.claim
973ab577-2cb7-4a20-a361-38b7b64f20e9	profile	claim.name
973ab577-2cb7-4a20-a361-38b7b64f20e9	String	jsonType.label
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	true	introspection.token.claim
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	true	userinfo.token.claim
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	firstName	user.attribute
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	true	id.token.claim
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	true	access.token.claim
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	given_name	claim.name
9e4e5862-f5b9-4640-a1fe-f5e4541e692e	String	jsonType.label
a7551288-3063-4d2e-bac4-97bf3f586b56	true	introspection.token.claim
a7551288-3063-4d2e-bac4-97bf3f586b56	true	userinfo.token.claim
a7551288-3063-4d2e-bac4-97bf3f586b56	true	id.token.claim
a7551288-3063-4d2e-bac4-97bf3f586b56	true	access.token.claim
b1591c7f-c137-4b58-81c1-89e5a6814eea	true	introspection.token.claim
b1591c7f-c137-4b58-81c1-89e5a6814eea	true	userinfo.token.claim
b1591c7f-c137-4b58-81c1-89e5a6814eea	gender	user.attribute
b1591c7f-c137-4b58-81c1-89e5a6814eea	true	id.token.claim
b1591c7f-c137-4b58-81c1-89e5a6814eea	true	access.token.claim
b1591c7f-c137-4b58-81c1-89e5a6814eea	gender	claim.name
b1591c7f-c137-4b58-81c1-89e5a6814eea	String	jsonType.label
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	true	introspection.token.claim
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	true	userinfo.token.claim
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	picture	user.attribute
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	true	id.token.claim
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	true	access.token.claim
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	picture	claim.name
c6c4eef4-1aaf-4bd7-867a-8e734c92d0e4	String	jsonType.label
c73f08bd-f010-4984-a799-1035e611c77c	true	introspection.token.claim
c73f08bd-f010-4984-a799-1035e611c77c	true	userinfo.token.claim
c73f08bd-f010-4984-a799-1035e611c77c	website	user.attribute
c73f08bd-f010-4984-a799-1035e611c77c	true	id.token.claim
c73f08bd-f010-4984-a799-1035e611c77c	true	access.token.claim
c73f08bd-f010-4984-a799-1035e611c77c	website	claim.name
c73f08bd-f010-4984-a799-1035e611c77c	String	jsonType.label
ca7d681c-9592-4704-a166-4cb56a86ca66	true	introspection.token.claim
ca7d681c-9592-4704-a166-4cb56a86ca66	true	userinfo.token.claim
ca7d681c-9592-4704-a166-4cb56a86ca66	updatedAt	user.attribute
ca7d681c-9592-4704-a166-4cb56a86ca66	true	id.token.claim
ca7d681c-9592-4704-a166-4cb56a86ca66	true	access.token.claim
ca7d681c-9592-4704-a166-4cb56a86ca66	updated_at	claim.name
ca7d681c-9592-4704-a166-4cb56a86ca66	long	jsonType.label
cdafaa1c-12dd-46c1-960a-e3530d10a083	true	introspection.token.claim
cdafaa1c-12dd-46c1-960a-e3530d10a083	true	userinfo.token.claim
cdafaa1c-12dd-46c1-960a-e3530d10a083	username	user.attribute
cdafaa1c-12dd-46c1-960a-e3530d10a083	true	id.token.claim
cdafaa1c-12dd-46c1-960a-e3530d10a083	true	access.token.claim
cdafaa1c-12dd-46c1-960a-e3530d10a083	preferred_username	claim.name
cdafaa1c-12dd-46c1-960a-e3530d10a083	String	jsonType.label
e6388e96-cf40-430c-8498-12747ad456b3	true	introspection.token.claim
e6388e96-cf40-430c-8498-12747ad456b3	true	userinfo.token.claim
e6388e96-cf40-430c-8498-12747ad456b3	lastName	user.attribute
e6388e96-cf40-430c-8498-12747ad456b3	true	id.token.claim
e6388e96-cf40-430c-8498-12747ad456b3	true	access.token.claim
e6388e96-cf40-430c-8498-12747ad456b3	family_name	claim.name
e6388e96-cf40-430c-8498-12747ad456b3	String	jsonType.label
fe39a38f-d44f-4931-b379-7e8e4080e0b7	true	introspection.token.claim
fe39a38f-d44f-4931-b379-7e8e4080e0b7	true	userinfo.token.claim
fe39a38f-d44f-4931-b379-7e8e4080e0b7	locale	user.attribute
fe39a38f-d44f-4931-b379-7e8e4080e0b7	true	id.token.claim
fe39a38f-d44f-4931-b379-7e8e4080e0b7	true	access.token.claim
fe39a38f-d44f-4931-b379-7e8e4080e0b7	locale	claim.name
fe39a38f-d44f-4931-b379-7e8e4080e0b7	String	jsonType.label
fe84f474-5d72-47bf-a678-aa00ec8da04d	true	introspection.token.claim
fe84f474-5d72-47bf-a678-aa00ec8da04d	true	userinfo.token.claim
fe84f474-5d72-47bf-a678-aa00ec8da04d	zoneinfo	user.attribute
fe84f474-5d72-47bf-a678-aa00ec8da04d	true	id.token.claim
fe84f474-5d72-47bf-a678-aa00ec8da04d	true	access.token.claim
fe84f474-5d72-47bf-a678-aa00ec8da04d	zoneinfo	claim.name
fe84f474-5d72-47bf-a678-aa00ec8da04d	String	jsonType.label
12484cfa-b681-4e28-8c03-fe88da15b68b	true	introspection.token.claim
12484cfa-b681-4e28-8c03-fe88da15b68b	true	userinfo.token.claim
12484cfa-b681-4e28-8c03-fe88da15b68b	emailVerified	user.attribute
12484cfa-b681-4e28-8c03-fe88da15b68b	true	id.token.claim
12484cfa-b681-4e28-8c03-fe88da15b68b	true	access.token.claim
12484cfa-b681-4e28-8c03-fe88da15b68b	email_verified	claim.name
12484cfa-b681-4e28-8c03-fe88da15b68b	boolean	jsonType.label
aeee59ab-e607-4893-b42d-1f1e91dccbca	true	introspection.token.claim
aeee59ab-e607-4893-b42d-1f1e91dccbca	true	userinfo.token.claim
aeee59ab-e607-4893-b42d-1f1e91dccbca	email	user.attribute
aeee59ab-e607-4893-b42d-1f1e91dccbca	true	id.token.claim
aeee59ab-e607-4893-b42d-1f1e91dccbca	true	access.token.claim
aeee59ab-e607-4893-b42d-1f1e91dccbca	email	claim.name
aeee59ab-e607-4893-b42d-1f1e91dccbca	String	jsonType.label
efdec5a3-e9f4-4b7b-a161-0f8934bac486	formatted	user.attribute.formatted
efdec5a3-e9f4-4b7b-a161-0f8934bac486	country	user.attribute.country
efdec5a3-e9f4-4b7b-a161-0f8934bac486	true	introspection.token.claim
efdec5a3-e9f4-4b7b-a161-0f8934bac486	postal_code	user.attribute.postal_code
efdec5a3-e9f4-4b7b-a161-0f8934bac486	true	userinfo.token.claim
efdec5a3-e9f4-4b7b-a161-0f8934bac486	street	user.attribute.street
efdec5a3-e9f4-4b7b-a161-0f8934bac486	true	id.token.claim
efdec5a3-e9f4-4b7b-a161-0f8934bac486	region	user.attribute.region
efdec5a3-e9f4-4b7b-a161-0f8934bac486	true	access.token.claim
efdec5a3-e9f4-4b7b-a161-0f8934bac486	locality	user.attribute.locality
d1bd7b19-6471-48aa-9b85-f7c04d356799	true	introspection.token.claim
d1bd7b19-6471-48aa-9b85-f7c04d356799	true	userinfo.token.claim
d1bd7b19-6471-48aa-9b85-f7c04d356799	phoneNumber	user.attribute
d1bd7b19-6471-48aa-9b85-f7c04d356799	true	id.token.claim
d1bd7b19-6471-48aa-9b85-f7c04d356799	true	access.token.claim
d1bd7b19-6471-48aa-9b85-f7c04d356799	phone_number	claim.name
d1bd7b19-6471-48aa-9b85-f7c04d356799	String	jsonType.label
e1af8c03-d74f-462c-a91e-dc3d1272120c	true	introspection.token.claim
e1af8c03-d74f-462c-a91e-dc3d1272120c	true	userinfo.token.claim
e1af8c03-d74f-462c-a91e-dc3d1272120c	phoneNumberVerified	user.attribute
e1af8c03-d74f-462c-a91e-dc3d1272120c	true	id.token.claim
e1af8c03-d74f-462c-a91e-dc3d1272120c	true	access.token.claim
e1af8c03-d74f-462c-a91e-dc3d1272120c	phone_number_verified	claim.name
e1af8c03-d74f-462c-a91e-dc3d1272120c	boolean	jsonType.label
05e564b7-dcb8-456a-a662-974dd96a4562	true	introspection.token.claim
05e564b7-dcb8-456a-a662-974dd96a4562	true	access.token.claim
9446c2d9-8952-44a3-8d21-96bc903ccdf8	true	introspection.token.claim
9446c2d9-8952-44a3-8d21-96bc903ccdf8	true	multivalued
9446c2d9-8952-44a3-8d21-96bc903ccdf8	foo	user.attribute
9446c2d9-8952-44a3-8d21-96bc903ccdf8	true	access.token.claim
9446c2d9-8952-44a3-8d21-96bc903ccdf8	resource_access.${client_id}.roles	claim.name
9446c2d9-8952-44a3-8d21-96bc903ccdf8	String	jsonType.label
cc71d474-cabf-403f-bff9-ba39edd0a370	true	introspection.token.claim
cc71d474-cabf-403f-bff9-ba39edd0a370	true	multivalued
cc71d474-cabf-403f-bff9-ba39edd0a370	foo	user.attribute
cc71d474-cabf-403f-bff9-ba39edd0a370	true	access.token.claim
cc71d474-cabf-403f-bff9-ba39edd0a370	realm_access.roles	claim.name
cc71d474-cabf-403f-bff9-ba39edd0a370	String	jsonType.label
13d96587-6855-4c81-80ad-93fd7f424d26	true	introspection.token.claim
13d96587-6855-4c81-80ad-93fd7f424d26	true	access.token.claim
113a4d3b-c8eb-4edf-ab81-a53733c985be	true	introspection.token.claim
113a4d3b-c8eb-4edf-ab81-a53733c985be	true	userinfo.token.claim
113a4d3b-c8eb-4edf-ab81-a53733c985be	username	user.attribute
113a4d3b-c8eb-4edf-ab81-a53733c985be	true	id.token.claim
113a4d3b-c8eb-4edf-ab81-a53733c985be	true	access.token.claim
113a4d3b-c8eb-4edf-ab81-a53733c985be	upn	claim.name
113a4d3b-c8eb-4edf-ab81-a53733c985be	String	jsonType.label
6496fb33-61bb-466f-9541-65c4e719ca11	true	introspection.token.claim
6496fb33-61bb-466f-9541-65c4e719ca11	true	multivalued
6496fb33-61bb-466f-9541-65c4e719ca11	foo	user.attribute
6496fb33-61bb-466f-9541-65c4e719ca11	true	id.token.claim
6496fb33-61bb-466f-9541-65c4e719ca11	true	access.token.claim
6496fb33-61bb-466f-9541-65c4e719ca11	groups	claim.name
6496fb33-61bb-466f-9541-65c4e719ca11	String	jsonType.label
4dfec03c-a91d-4379-9741-15ba47571476	true	introspection.token.claim
4dfec03c-a91d-4379-9741-15ba47571476	true	id.token.claim
4dfec03c-a91d-4379-9741-15ba47571476	true	access.token.claim
54f1d240-78da-4ab0-a8a5-01e7b3dfeaf9	true	introspection.token.claim
54f1d240-78da-4ab0-a8a5-01e7b3dfeaf9	true	access.token.claim
da432308-5849-4ea6-a70e-cd850981e950	AUTH_TIME	user.session.note
da432308-5849-4ea6-a70e-cd850981e950	true	introspection.token.claim
da432308-5849-4ea6-a70e-cd850981e950	true	id.token.claim
da432308-5849-4ea6-a70e-cd850981e950	true	access.token.claim
da432308-5849-4ea6-a70e-cd850981e950	auth_time	claim.name
da432308-5849-4ea6-a70e-cd850981e950	long	jsonType.label
7752c37f-8640-4905-bfdb-48fa97c8892d	client_id	user.session.note
7752c37f-8640-4905-bfdb-48fa97c8892d	true	introspection.token.claim
7752c37f-8640-4905-bfdb-48fa97c8892d	true	id.token.claim
7752c37f-8640-4905-bfdb-48fa97c8892d	true	access.token.claim
7752c37f-8640-4905-bfdb-48fa97c8892d	client_id	claim.name
7752c37f-8640-4905-bfdb-48fa97c8892d	String	jsonType.label
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	clientAddress	user.session.note
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	true	introspection.token.claim
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	true	id.token.claim
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	true	access.token.claim
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	clientAddress	claim.name
9b3dbeb0-2b91-4572-8bd4-4a9d211f0e6f	String	jsonType.label
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	clientHost	user.session.note
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	true	introspection.token.claim
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	true	id.token.claim
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	true	access.token.claim
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	clientHost	claim.name
c6ef72e1-9b2f-4bf6-9f67-2a8e9339aa15	String	jsonType.label
4739787e-6483-4d61-92e8-826276d62e71	true	introspection.token.claim
4739787e-6483-4d61-92e8-826276d62e71	true	multivalued
4739787e-6483-4d61-92e8-826276d62e71	true	id.token.claim
4739787e-6483-4d61-92e8-826276d62e71	true	access.token.claim
4739787e-6483-4d61-92e8-826276d62e71	organization	claim.name
4739787e-6483-4d61-92e8-826276d62e71	String	jsonType.label
1a194bfd-4376-40bf-b765-1af6d5c4cde0	false	single
1a194bfd-4376-40bf-b765-1af6d5c4cde0	Basic	attribute.nameformat
1a194bfd-4376-40bf-b765-1af6d5c4cde0	Role	attribute.name
08d6c890-1200-4db6-ac7c-d4995a38394f	true	introspection.token.claim
08d6c890-1200-4db6-ac7c-d4995a38394f	true	userinfo.token.claim
08d6c890-1200-4db6-ac7c-d4995a38394f	true	id.token.claim
08d6c890-1200-4db6-ac7c-d4995a38394f	true	access.token.claim
161c5c1d-a993-4eea-8ba7-6048aacca372	true	introspection.token.claim
161c5c1d-a993-4eea-8ba7-6048aacca372	true	userinfo.token.claim
161c5c1d-a993-4eea-8ba7-6048aacca372	picture	user.attribute
161c5c1d-a993-4eea-8ba7-6048aacca372	true	id.token.claim
161c5c1d-a993-4eea-8ba7-6048aacca372	true	access.token.claim
161c5c1d-a993-4eea-8ba7-6048aacca372	picture	claim.name
161c5c1d-a993-4eea-8ba7-6048aacca372	String	jsonType.label
1da1cce5-2793-46b7-a65c-9717abb4b5f5	true	introspection.token.claim
1da1cce5-2793-46b7-a65c-9717abb4b5f5	true	userinfo.token.claim
1da1cce5-2793-46b7-a65c-9717abb4b5f5	updatedAt	user.attribute
1da1cce5-2793-46b7-a65c-9717abb4b5f5	true	id.token.claim
1da1cce5-2793-46b7-a65c-9717abb4b5f5	true	access.token.claim
1da1cce5-2793-46b7-a65c-9717abb4b5f5	updated_at	claim.name
1da1cce5-2793-46b7-a65c-9717abb4b5f5	long	jsonType.label
368c6b62-6e4f-497b-bdbc-58f761194c21	true	introspection.token.claim
368c6b62-6e4f-497b-bdbc-58f761194c21	true	userinfo.token.claim
368c6b62-6e4f-497b-bdbc-58f761194c21	zoneinfo	user.attribute
368c6b62-6e4f-497b-bdbc-58f761194c21	true	id.token.claim
368c6b62-6e4f-497b-bdbc-58f761194c21	true	access.token.claim
368c6b62-6e4f-497b-bdbc-58f761194c21	zoneinfo	claim.name
368c6b62-6e4f-497b-bdbc-58f761194c21	String	jsonType.label
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	true	introspection.token.claim
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	true	userinfo.token.claim
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	nickname	user.attribute
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	true	id.token.claim
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	true	access.token.claim
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	nickname	claim.name
3f8d6e29-65aa-4dde-a93b-b3dcd768f9a3	String	jsonType.label
476e109d-dcec-4235-aa72-4301b2b0f9a8	true	introspection.token.claim
476e109d-dcec-4235-aa72-4301b2b0f9a8	true	userinfo.token.claim
476e109d-dcec-4235-aa72-4301b2b0f9a8	website	user.attribute
476e109d-dcec-4235-aa72-4301b2b0f9a8	true	id.token.claim
476e109d-dcec-4235-aa72-4301b2b0f9a8	true	access.token.claim
476e109d-dcec-4235-aa72-4301b2b0f9a8	website	claim.name
476e109d-dcec-4235-aa72-4301b2b0f9a8	String	jsonType.label
4a48aed1-824c-48b3-9a18-b49001b91962	true	introspection.token.claim
4a48aed1-824c-48b3-9a18-b49001b91962	true	userinfo.token.claim
4a48aed1-824c-48b3-9a18-b49001b91962	middleName	user.attribute
4a48aed1-824c-48b3-9a18-b49001b91962	true	id.token.claim
4a48aed1-824c-48b3-9a18-b49001b91962	true	access.token.claim
4a48aed1-824c-48b3-9a18-b49001b91962	middle_name	claim.name
4a48aed1-824c-48b3-9a18-b49001b91962	String	jsonType.label
4e25a4aa-9463-4635-84de-db5e174c7157	true	introspection.token.claim
4e25a4aa-9463-4635-84de-db5e174c7157	true	userinfo.token.claim
4e25a4aa-9463-4635-84de-db5e174c7157	profile	user.attribute
4e25a4aa-9463-4635-84de-db5e174c7157	true	id.token.claim
4e25a4aa-9463-4635-84de-db5e174c7157	true	access.token.claim
4e25a4aa-9463-4635-84de-db5e174c7157	profile	claim.name
4e25a4aa-9463-4635-84de-db5e174c7157	String	jsonType.label
a6c1f7c0-a10a-44f7-8930-68aa9145d899	true	introspection.token.claim
a6c1f7c0-a10a-44f7-8930-68aa9145d899	true	userinfo.token.claim
a6c1f7c0-a10a-44f7-8930-68aa9145d899	birthdate	user.attribute
a6c1f7c0-a10a-44f7-8930-68aa9145d899	true	id.token.claim
a6c1f7c0-a10a-44f7-8930-68aa9145d899	true	access.token.claim
a6c1f7c0-a10a-44f7-8930-68aa9145d899	birthdate	claim.name
a6c1f7c0-a10a-44f7-8930-68aa9145d899	String	jsonType.label
d0c8a178-8723-40d0-8202-fe43ba06c3cc	true	introspection.token.claim
d0c8a178-8723-40d0-8202-fe43ba06c3cc	true	userinfo.token.claim
d0c8a178-8723-40d0-8202-fe43ba06c3cc	username	user.attribute
d0c8a178-8723-40d0-8202-fe43ba06c3cc	true	id.token.claim
d0c8a178-8723-40d0-8202-fe43ba06c3cc	true	access.token.claim
d0c8a178-8723-40d0-8202-fe43ba06c3cc	preferred_username	claim.name
d0c8a178-8723-40d0-8202-fe43ba06c3cc	String	jsonType.label
e4034110-5186-422d-9a57-2bdcb8be8298	true	introspection.token.claim
e4034110-5186-422d-9a57-2bdcb8be8298	true	userinfo.token.claim
e4034110-5186-422d-9a57-2bdcb8be8298	gender	user.attribute
e4034110-5186-422d-9a57-2bdcb8be8298	true	id.token.claim
e4034110-5186-422d-9a57-2bdcb8be8298	true	access.token.claim
e4034110-5186-422d-9a57-2bdcb8be8298	gender	claim.name
e4034110-5186-422d-9a57-2bdcb8be8298	String	jsonType.label
f1519d05-e704-40f5-ba7e-384bd471311b	true	introspection.token.claim
f1519d05-e704-40f5-ba7e-384bd471311b	true	userinfo.token.claim
f1519d05-e704-40f5-ba7e-384bd471311b	lastName	user.attribute
f1519d05-e704-40f5-ba7e-384bd471311b	true	id.token.claim
f1519d05-e704-40f5-ba7e-384bd471311b	true	access.token.claim
f1519d05-e704-40f5-ba7e-384bd471311b	family_name	claim.name
f1519d05-e704-40f5-ba7e-384bd471311b	String	jsonType.label
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	true	introspection.token.claim
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	true	userinfo.token.claim
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	firstName	user.attribute
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	true	id.token.claim
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	true	access.token.claim
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	given_name	claim.name
f31678e9-eb66-438d-9bd4-15bb6b1ab6e1	String	jsonType.label
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	true	introspection.token.claim
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	true	userinfo.token.claim
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	locale	user.attribute
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	true	id.token.claim
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	true	access.token.claim
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	locale	claim.name
f9f2f8e7-f475-46bc-a2c4-7519c1c9dde4	String	jsonType.label
b5eb9211-b02f-43b8-8237-6dda67330da3	true	introspection.token.claim
b5eb9211-b02f-43b8-8237-6dda67330da3	true	userinfo.token.claim
b5eb9211-b02f-43b8-8237-6dda67330da3	email	user.attribute
b5eb9211-b02f-43b8-8237-6dda67330da3	true	id.token.claim
b5eb9211-b02f-43b8-8237-6dda67330da3	true	access.token.claim
b5eb9211-b02f-43b8-8237-6dda67330da3	email	claim.name
b5eb9211-b02f-43b8-8237-6dda67330da3	String	jsonType.label
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	true	introspection.token.claim
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	true	userinfo.token.claim
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	emailVerified	user.attribute
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	true	id.token.claim
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	true	access.token.claim
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	email_verified	claim.name
ef6aeaef-d8ae-4669-80c3-7fc2e5486b73	boolean	jsonType.label
e451c205-1bdc-482c-b034-d8f322497e29	formatted	user.attribute.formatted
e451c205-1bdc-482c-b034-d8f322497e29	country	user.attribute.country
e451c205-1bdc-482c-b034-d8f322497e29	true	introspection.token.claim
e451c205-1bdc-482c-b034-d8f322497e29	postal_code	user.attribute.postal_code
e451c205-1bdc-482c-b034-d8f322497e29	true	userinfo.token.claim
e451c205-1bdc-482c-b034-d8f322497e29	street	user.attribute.street
e451c205-1bdc-482c-b034-d8f322497e29	true	id.token.claim
e451c205-1bdc-482c-b034-d8f322497e29	region	user.attribute.region
e451c205-1bdc-482c-b034-d8f322497e29	true	access.token.claim
e451c205-1bdc-482c-b034-d8f322497e29	locality	user.attribute.locality
8ce1f652-8f8e-400e-842b-b3942780ed44	true	introspection.token.claim
8ce1f652-8f8e-400e-842b-b3942780ed44	true	userinfo.token.claim
8ce1f652-8f8e-400e-842b-b3942780ed44	phoneNumberVerified	user.attribute
8ce1f652-8f8e-400e-842b-b3942780ed44	true	id.token.claim
8ce1f652-8f8e-400e-842b-b3942780ed44	true	access.token.claim
8ce1f652-8f8e-400e-842b-b3942780ed44	phone_number_verified	claim.name
8ce1f652-8f8e-400e-842b-b3942780ed44	boolean	jsonType.label
ca401663-f7ac-4b66-b1ec-97a3e7866241	true	introspection.token.claim
ca401663-f7ac-4b66-b1ec-97a3e7866241	true	userinfo.token.claim
ca401663-f7ac-4b66-b1ec-97a3e7866241	phoneNumber	user.attribute
ca401663-f7ac-4b66-b1ec-97a3e7866241	true	id.token.claim
ca401663-f7ac-4b66-b1ec-97a3e7866241	true	access.token.claim
ca401663-f7ac-4b66-b1ec-97a3e7866241	phone_number	claim.name
ca401663-f7ac-4b66-b1ec-97a3e7866241	String	jsonType.label
25e47ae2-5d86-4037-b832-d4b0316417c5	true	introspection.token.claim
25e47ae2-5d86-4037-b832-d4b0316417c5	true	multivalued
25e47ae2-5d86-4037-b832-d4b0316417c5	foo	user.attribute
25e47ae2-5d86-4037-b832-d4b0316417c5	true	access.token.claim
25e47ae2-5d86-4037-b832-d4b0316417c5	resource_access.${client_id}.roles	claim.name
25e47ae2-5d86-4037-b832-d4b0316417c5	String	jsonType.label
6836d202-a182-4b02-8a15-f41731f04414	true	introspection.token.claim
6836d202-a182-4b02-8a15-f41731f04414	true	access.token.claim
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	true	introspection.token.claim
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	true	multivalued
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	foo	user.attribute
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	true	access.token.claim
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	realm_access.roles	claim.name
f0b12ad9-2a76-4897-a55b-bd3b5f784c74	String	jsonType.label
d8aadda8-c2cc-4b99-8252-3488c9930e7b	true	introspection.token.claim
d8aadda8-c2cc-4b99-8252-3488c9930e7b	true	access.token.claim
1bae6ae9-548c-43a6-8192-41bfb54f27a0	true	introspection.token.claim
1bae6ae9-548c-43a6-8192-41bfb54f27a0	true	multivalued
1bae6ae9-548c-43a6-8192-41bfb54f27a0	foo	user.attribute
1bae6ae9-548c-43a6-8192-41bfb54f27a0	true	id.token.claim
1bae6ae9-548c-43a6-8192-41bfb54f27a0	true	access.token.claim
1bae6ae9-548c-43a6-8192-41bfb54f27a0	groups	claim.name
1bae6ae9-548c-43a6-8192-41bfb54f27a0	String	jsonType.label
f16159ac-9617-4d8f-9c1c-655f142a705a	true	introspection.token.claim
f16159ac-9617-4d8f-9c1c-655f142a705a	true	userinfo.token.claim
f16159ac-9617-4d8f-9c1c-655f142a705a	username	user.attribute
f16159ac-9617-4d8f-9c1c-655f142a705a	true	id.token.claim
f16159ac-9617-4d8f-9c1c-655f142a705a	true	access.token.claim
f16159ac-9617-4d8f-9c1c-655f142a705a	upn	claim.name
f16159ac-9617-4d8f-9c1c-655f142a705a	String	jsonType.label
9cee18b6-27d6-4099-99e3-38a89a84316f	true	introspection.token.claim
9cee18b6-27d6-4099-99e3-38a89a84316f	true	id.token.claim
9cee18b6-27d6-4099-99e3-38a89a84316f	true	access.token.claim
1a71ea94-e76f-4166-a660-99cce882c27a	true	introspection.token.claim
1a71ea94-e76f-4166-a660-99cce882c27a	true	access.token.claim
f9e485f1-5287-4af9-918c-50b28ef62ded	AUTH_TIME	user.session.note
f9e485f1-5287-4af9-918c-50b28ef62ded	true	introspection.token.claim
f9e485f1-5287-4af9-918c-50b28ef62ded	true	id.token.claim
f9e485f1-5287-4af9-918c-50b28ef62ded	true	access.token.claim
f9e485f1-5287-4af9-918c-50b28ef62ded	auth_time	claim.name
f9e485f1-5287-4af9-918c-50b28ef62ded	long	jsonType.label
03239846-eb1e-423a-b4ef-5e533f4fa99b	clientAddress	user.session.note
03239846-eb1e-423a-b4ef-5e533f4fa99b	true	introspection.token.claim
03239846-eb1e-423a-b4ef-5e533f4fa99b	true	id.token.claim
03239846-eb1e-423a-b4ef-5e533f4fa99b	true	access.token.claim
03239846-eb1e-423a-b4ef-5e533f4fa99b	clientAddress	claim.name
03239846-eb1e-423a-b4ef-5e533f4fa99b	String	jsonType.label
056b968d-996d-4382-b3b7-cd2562758928	clientHost	user.session.note
056b968d-996d-4382-b3b7-cd2562758928	true	introspection.token.claim
056b968d-996d-4382-b3b7-cd2562758928	true	id.token.claim
056b968d-996d-4382-b3b7-cd2562758928	true	access.token.claim
056b968d-996d-4382-b3b7-cd2562758928	clientHost	claim.name
056b968d-996d-4382-b3b7-cd2562758928	String	jsonType.label
d6035e29-39c5-4d64-ad38-b932ffd76102	client_id	user.session.note
d6035e29-39c5-4d64-ad38-b932ffd76102	true	introspection.token.claim
d6035e29-39c5-4d64-ad38-b932ffd76102	true	id.token.claim
d6035e29-39c5-4d64-ad38-b932ffd76102	true	access.token.claim
d6035e29-39c5-4d64-ad38-b932ffd76102	client_id	claim.name
d6035e29-39c5-4d64-ad38-b932ffd76102	String	jsonType.label
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	true	introspection.token.claim
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	true	multivalued
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	true	id.token.claim
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	true	access.token.claim
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	organization	claim.name
ca32f68b-c9ae-45fe-98d1-b7fb772914c5	String	jsonType.label
52f4954a-5821-4f24-901d-597d7dae6266	true	introspection.token.claim
52f4954a-5821-4f24-901d-597d7dae6266	true	userinfo.token.claim
52f4954a-5821-4f24-901d-597d7dae6266	locale	user.attribute
52f4954a-5821-4f24-901d-597d7dae6266	true	id.token.claim
52f4954a-5821-4f24-901d-597d7dae6266	true	access.token.claim
52f4954a-5821-4f24-901d-597d7dae6266	locale	claim.name
52f4954a-5821-4f24-901d-597d7dae6266	String	jsonType.label
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	tasks-api	included.client.audience
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	false	id.token.claim
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	false	lightweight.claim
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	true	access.token.claim
8ddf5409-e1f2-4dcc-8030-1fd7855f4ad5	true	introspection.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	60	300	300	\N	\N	\N	t	f	0	\N	task-flow-realm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	29cb06f8-27fa-4416-86a2-b0e0353e9fc5	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e6247dd5-c46f-4ee1-9ce8-683d67da3076	5191598e-5f46-413a-ad4b-84cf497793b8	25420f07-b172-487b-ac2a-6361582d68d2	044b35a1-707b-4c17-bb3d-ed0459948a7f	cd4d8776-38b0-417e-b4b6-412b14d5946b	2592000	f	900	t	f	5106f02d-1860-4986-a02d-a5f0ccf1e7a7	0	f	0	0	d1505096-51ce-4d3c-86ea-ded36a7aa46d
1739fb5b-3e74-44ff-bfea-37693723158e	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	0001e805-bf98-463b-a5bc-5d45e9cf9d51	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	b04802bd-a6b6-48bd-b85b-18d98a058c30	5eca29a5-7cf9-429e-bff8-a4ff6bb70be7	896d433b-a2bb-43f8-a918-d4db5ae55bb1	7cf8f60f-b50b-4500-a745-b57e810c3ffd	bc467cb0-350c-41c7-8ed5-07a0d6055c24	2592000	f	900	t	f	c55bc4f7-5884-45a4-87e3-0ca3214a798c	0	f	0	0	67bd1f9b-d155-4294-9050-125f9a0ffbf8
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	1739fb5b-3e74-44ff-bfea-37693723158e	
_browser_header.xContentTypeOptions	1739fb5b-3e74-44ff-bfea-37693723158e	nosniff
_browser_header.referrerPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	no-referrer
_browser_header.xRobotsTag	1739fb5b-3e74-44ff-bfea-37693723158e	none
_browser_header.xFrameOptions	1739fb5b-3e74-44ff-bfea-37693723158e	SAMEORIGIN
_browser_header.contentSecurityPolicy	1739fb5b-3e74-44ff-bfea-37693723158e	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	1739fb5b-3e74-44ff-bfea-37693723158e	1; mode=block
_browser_header.strictTransportSecurity	1739fb5b-3e74-44ff-bfea-37693723158e	max-age=31536000; includeSubDomains
bruteForceProtected	1739fb5b-3e74-44ff-bfea-37693723158e	false
permanentLockout	1739fb5b-3e74-44ff-bfea-37693723158e	false
maxTemporaryLockouts	1739fb5b-3e74-44ff-bfea-37693723158e	0
bruteForceStrategy	1739fb5b-3e74-44ff-bfea-37693723158e	MULTIPLE
maxFailureWaitSeconds	1739fb5b-3e74-44ff-bfea-37693723158e	900
minimumQuickLoginWaitSeconds	1739fb5b-3e74-44ff-bfea-37693723158e	60
waitIncrementSeconds	1739fb5b-3e74-44ff-bfea-37693723158e	60
quickLoginCheckMilliSeconds	1739fb5b-3e74-44ff-bfea-37693723158e	1000
maxDeltaTimeSeconds	1739fb5b-3e74-44ff-bfea-37693723158e	43200
failureFactor	1739fb5b-3e74-44ff-bfea-37693723158e	30
realmReusableOtpCode	1739fb5b-3e74-44ff-bfea-37693723158e	false
firstBrokerLoginFlowId	1739fb5b-3e74-44ff-bfea-37693723158e	78f500dd-830b-49a3-a2b5-811e11dba651
displayName	1739fb5b-3e74-44ff-bfea-37693723158e	Keycloak
displayNameHtml	1739fb5b-3e74-44ff-bfea-37693723158e	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	1739fb5b-3e74-44ff-bfea-37693723158e	RS256
offlineSessionMaxLifespanEnabled	1739fb5b-3e74-44ff-bfea-37693723158e	false
offlineSessionMaxLifespan	1739fb5b-3e74-44ff-bfea-37693723158e	5184000
_browser_header.contentSecurityPolicyReportOnly	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	
_browser_header.xContentTypeOptions	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	nosniff
_browser_header.referrerPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	no-referrer
_browser_header.xRobotsTag	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	none
_browser_header.xFrameOptions	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	SAMEORIGIN
_browser_header.contentSecurityPolicy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	1; mode=block
_browser_header.strictTransportSecurity	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	max-age=31536000; includeSubDomains
bruteForceProtected	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
permanentLockout	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
maxTemporaryLockouts	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0
bruteForceStrategy	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	MULTIPLE
maxFailureWaitSeconds	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	900
minimumQuickLoginWaitSeconds	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	60
waitIncrementSeconds	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	60
quickLoginCheckMilliSeconds	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	1000
maxDeltaTimeSeconds	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	43200
failureFactor	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	30
realmReusableOtpCode	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
defaultSignatureAlgorithm	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	RS256
offlineSessionMaxLifespanEnabled	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
offlineSessionMaxLifespan	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5184000
actionTokenGeneratedByAdminLifespan	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	43200
actionTokenGeneratedByUserLifespan	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	300
oauth2DeviceCodeLifespan	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	600
oauth2DevicePollingInterval	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5
webAuthnPolicyRpEntityName	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	keycloak
webAuthnPolicySignatureAlgorithms	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ES256,RS256
webAuthnPolicyRpId	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	
webAuthnPolicyAttestationConveyancePreference	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyAuthenticatorAttachment	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyRequireResidentKey	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyUserVerificationRequirement	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyCreateTimeout	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0
webAuthnPolicyAvoidSameAuthenticatorRegister	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
webAuthnPolicyRpEntityNamePasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	ES256,RS256
webAuthnPolicyRpIdPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	
webAuthnPolicyAttestationConveyancePreferencePasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyRequireResidentKeyPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	not specified
webAuthnPolicyCreateTimeoutPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	false
cibaBackchannelTokenDeliveryMode	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	poll
cibaExpiresIn	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	120
cibaInterval	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	5
cibaAuthRequestedUserHint	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	login_hint
parRequestUriLifespan	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	60
firstBrokerLoginFlowId	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	a679397d-ce45-4a94-9f3f-0e4b78a7b044
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
1739fb5b-3e74-44ff-bfea-37693723158e	jboss-logging
a3ade43b-1924-4f20-b0e0-9c9b991a47d2	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	1739fb5b-3e74-44ff-bfea-37693723158e
password	password	t	t	a3ade43b-1924-4f20-b0e0-9c9b991a47d2
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
38a5e274-e55b-45aa-87b0-c41c8443e5c5	/realms/master/account/*
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	/realms/master/account/*
74033654-fcf1-4ebe-877d-25e96dcdd914	/admin/master/console/*
4fc86ede-2848-4493-bc3e-b175c51fcf68	/realms/task-flow-realm/account/*
9a245b58-a810-42c8-a40e-f65528d330b3	/realms/task-flow-realm/account/*
33909007-b1ae-48f2-b4e4-86cd51b4c359	/admin/task-flow-realm/console/*
5081130b-b692-4acc-8759-2504425efa0a	http://localhost:5002/swagger/oauth2-redirect.html
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	http://localhost:5002/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
84deb880-77a9-4704-a210-96b959195bfd	VERIFY_EMAIL	Verify Email	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	VERIFY_EMAIL	50
0d1dd5e9-22e9-48f5-8ac1-4542900d5f27	UPDATE_PROFILE	Update Profile	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	UPDATE_PROFILE	40
a41bad3a-82fa-4678-a904-39ceec9575e8	CONFIGURE_TOTP	Configure OTP	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	CONFIGURE_TOTP	10
30f82b9f-1634-4c65-8e69-f5c37ad1443d	UPDATE_PASSWORD	Update Password	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	UPDATE_PASSWORD	30
2c4ed690-0c69-4a39-b531-d5f4b5324134	TERMS_AND_CONDITIONS	Terms and Conditions	1739fb5b-3e74-44ff-bfea-37693723158e	f	f	TERMS_AND_CONDITIONS	20
5bf9f890-7878-47e5-855d-9292a06391c8	delete_account	Delete Account	1739fb5b-3e74-44ff-bfea-37693723158e	f	f	delete_account	60
52a2669c-0003-4a34-a872-1d2829d6f9a2	delete_credential	Delete Credential	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	delete_credential	100
701c4389-24c1-497a-b574-2f3e50fa33f9	update_user_locale	Update User Locale	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	update_user_locale	1000
e9c4c405-1b74-4ff5-bfd6-d57a7c5795d0	webauthn-register	Webauthn Register	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	webauthn-register	70
a44e2d97-e373-494e-b937-b4438cb95cf4	webauthn-register-passwordless	Webauthn Register Passwordless	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	webauthn-register-passwordless	80
1b9b318e-85da-406b-9815-ec0a6c054e8e	VERIFY_PROFILE	Verify Profile	1739fb5b-3e74-44ff-bfea-37693723158e	t	f	VERIFY_PROFILE	90
2c6ba5dd-4c94-41c5-9666-0152f6465d01	VERIFY_EMAIL	Verify Email	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	VERIFY_EMAIL	50
f95efa9d-ec90-45f7-8ad4-2409d4ae21d7	UPDATE_PROFILE	Update Profile	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	UPDATE_PROFILE	40
9c137665-efdb-4340-b34d-5cbf331c24ee	CONFIGURE_TOTP	Configure OTP	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	CONFIGURE_TOTP	10
ec7c0b5a-65d3-4acd-8aa5-e439321d8047	UPDATE_PASSWORD	Update Password	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	UPDATE_PASSWORD	30
a8508367-3183-4108-bb51-258feb866317	TERMS_AND_CONDITIONS	Terms and Conditions	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f	f	TERMS_AND_CONDITIONS	20
cf14c039-f7d6-4863-bee6-2cb0693dd500	delete_account	Delete Account	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	f	f	delete_account	60
b4df4b88-f6a4-454f-8659-a56fa8625142	delete_credential	Delete Credential	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	delete_credential	100
6476d87b-3e32-41d3-b530-e36cccc5586a	update_user_locale	Update User Locale	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	update_user_locale	1000
a98b7287-8330-42be-8da5-2727305ea2b1	webauthn-register	Webauthn Register	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	webauthn-register	70
258e4737-371f-4739-bf41-8073176a1218	webauthn-register-passwordless	Webauthn Register Passwordless	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	webauthn-register-passwordless	80
d63c8b30-a8b4-447f-b870-7e594c70252d	VERIFY_PROFILE	Verify Profile	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	0c9f5607-fb44-4223-b50f-725f89eb38c7
d337d6bc-0b6e-47b7-8e2f-2a35c3d9ecaa	a7878adc-a11c-4241-959d-9cac566f61a5
9a245b58-a810-42c8-a40e-f65528d330b3	a0524e3a-68b3-4ef7-a063-d837968b7884
9a245b58-a810-42c8-a40e-f65528d330b3	1a42e6a0-7bbc-43d8-960c-b3a4dcc50b8e
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	bb4edd25-3fe3-49ee-9b9c-5b33edd67576	272dc818-d923-4bb7-bfb8-a284a763d90d	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
bb4edd25-3fe3-49ee-9b9c-5b33edd67576	\N	ecb98caa-00fd-48b7-adf5-562334b6c266	f	t	\N	\N	\N	1739fb5b-3e74-44ff-bfea-37693723158e	admin	1742332300525	\N	0
e41d3fde-0e87-498b-8efc-3d0ef2c6b0c9	5807keam.hi@gmail.com	5807keam.hi@gmail.com	t	t	\N	Павел	Зырянов	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	pavel_zyryanov	1742332482829	\N	0
27fb9261-0c4d-402c-8aff-0a4060ca1479	manager@gmail.com	manager@gmail.com	t	t	\N	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	test_manager	1742416901868	\N	0
a555cf40-2c3e-4724-a30d-7895c965c2d5	developer@gmail.com	developer@gmail.com	t	t	\N	\N	\N	a3ade43b-1924-4f20-b0e0-9c9b991a47d2	test_developer	1742416961264	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
6a0d6928-19c9-4ba5-8791-a2412c90fb32	a555cf40-2c3e-4724-a30d-7895c965c2d5	UNMANAGED
f91bbd76-551f-46ab-8e2b-f3584fd1725b	27fb9261-0c4d-402c-8aff-0a4060ca1479	UNMANAGED
f91bbd76-551f-46ab-8e2b-f3584fd1725b	e41d3fde-0e87-498b-8efc-3d0ef2c6b0c9	UNMANAGED
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
67bd1f9b-d155-4294-9050-125f9a0ffbf8	bb4edd25-3fe3-49ee-9b9c-5b33edd67576
3b8e6ac6-836c-4dda-a752-6f5a1dfb24c9	bb4edd25-3fe3-49ee-9b9c-5b33edd67576
d1505096-51ce-4d3c-86ea-ded36a7aa46d	e41d3fde-0e87-498b-8efc-3d0ef2c6b0c9
d1505096-51ce-4d3c-86ea-ded36a7aa46d	27fb9261-0c4d-402c-8aff-0a4060ca1479
d1505096-51ce-4d3c-86ea-ded36a7aa46d	a555cf40-2c3e-4724-a30d-7895c965c2d5
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.web_origins (client_id, value) FROM stdin;
74033654-fcf1-4ebe-877d-25e96dcdd914	+
33909007-b1ae-48f2-b4e4-86cd51b4c359	+
5081130b-b692-4acc-8759-2504425efa0a	http://localhost:5002
6b0c849d-86ba-4ea4-90af-2d17c1c8314f	http://localhost:5002
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

