<#--
  Override of Keycloak's base/keycloak.v2 password-commons.ftl.

  Upstream renders an opt-IN "Log out of other sessions" checkbox on
  every login-update-password screen — unchecked by default. That means
  a user who voluntarily changes their password (self-service account
  console, "forgot password" flow that lands on UPDATE_PASSWORD, etc.)
  can keep compromised devices signed in simply by not ticking a box
  they've probably never noticed.

  Our server-side admin-reset flow already wipes every KC SSO + BFF
  session via ``kc.user_logout`` + ``revoke_sessions_for_user`` before
  the user ever sees this screen. To keep the policy ("every password
  change signs you out everywhere") uniform across admin-initiated and
  self-service flows, we replace the checkbox with a hidden input
  that always submits ``logout-sessions=on``. Keycloak then terminates
  every other session for the user on submit, regardless of flow.

  If you ever need a visible confirmation toggle, restore the upstream
  macro from base/login/password-commons.ftl but default ``value=true``
  and consider disabling the input so users can't silently opt out.
-->
<#macro logoutOtherSessions>
    <input type="hidden" name="logout-sessions" value="on">
</#macro>
