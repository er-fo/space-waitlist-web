# CADAgent Privacy Policy
Version: 2026-01-18  
Effective until replaced. 

**Definitions:** “CADAgent,” “we,” “our,” and “us” mean the controller named below. “Service” means the CADAgent Autodesk Fusion 360 add-in, supporting backend, and related websites/APIs. “You” and “users” mean account holders and anyone using the Service.

This Privacy Policy explains how we collect, use, store, and protect information when you use CADAgent (the Autodesk Fusion 360 add-in and supporting backend) under the Bring Your Own Key (BYOK) model. It covers the desktop add-in, backend services, and any related websites or APIs operated by the controller named below.

## 1. Data Controller & Contact Information
- **Controller:** Erik Fornlund (individual developer)
- **Email:** eriknollett@gmail.com
- **Purpose:** Operating CADAgent, an AI-powered natural language interface for Autodesk Fusion 360.

## 2. Data Collection – What We Actually Collect
### User Account Data (via Supabase)
- Email addresses for authentication.
- User IDs (UUID) for session management and rate limiting.
- Authentication tokens (JWT access and refresh tokens).
- Sign-in timestamps and session metadata.

### CAD Model Data (processed, not stored permanently)
- Visual context: Base64-encoded PNG screenshots of the Fusion 360 viewport.
- Entity context: Geometry data for bodies, faces, and edges in the active design.
- Selection context: User-selected geometric elements.
- Spatial context: Parallel faces, body distances, and other spatial relationships.
- Timeline state: Feature history with indices.
- Document metadata: Document IDs, document names, and file paths (appearing in server logs).

### Usage Data (session logs)
- Session IDs and timestamps.
- LLM provider choice (Anthropic / OpenAI / Google).
- Token usage metrics (input/output token counts).
- Model cost estimates (calculated; not billed by us).
- User feedback (thumbs up/down verdicts on AI responses).
- Request/response pairs (prompts and LLM outputs).
- Error logs and execution results.

### Technical Data
- WebSocket connection metadata.
- Rate limiting counters.
- Server logs (connection events, authentication events, errors).

## 3. What We Do **Not** Collect or Store
- User-provided LLM API keys — stored only on the user’s machine at `~/.cadagent/api_keys.json` with `0600` permissions and never transmitted to CADAgent servers.
- API keys are sent directly from the backend to LLM providers and are never logged or stored by CADAgent.
- CAD design files — geometry context is processed in memory; complete design files are not stored.
- Payment information — CADAgent does not process payments (BYOK model).
- Analytics tracking — no Google Analytics, Mixpanel, or similar services.

## 4. How Data Is Collected
- **Authentication data:** Collected via Supabase magic link/OTP during sign-in.
- **CAD model context:** Extracted automatically when users submit natural language requests through the add-in palette.
- **Usage data:** Logged automatically during session execution in `runs/<timestamp>_session_<id>/` (hierarchical directory structure).
- **Technical data:** Logged via rpotating log files (`cadagent.log`, max 50MB total, 5 backups).

## 5. How Data Is Used
- **Authentication:** Verify identity and maintain secure sessions.
- **AI model processing:** Send CAD context to the user’s chosen LLM provider (using the user’s API key) to generate modeling operations.
- **Service operation:** Execute CAD operations, manage WebSocket connections, and enforce rate limits.
- **Debugging and improvement:** Use session logs to troubleshoot errors and improve AI performance.
- **Cost tracking:** Log token usage so users can monitor their LLM API consumption.
- **Quality assessment:** Use user feedback (thumbs up/down) to evaluate AI response quality.

## 6. Third-Party Data Sharing
### Supabase (Authentication Provider)
- **Data shared:** Email addresses, user IDs, authentication tokens.
- **Purpose:** User authentication and session management.
- **Privacy policy:** [[Link to Supabase's privacy policy](https://supabase.com/privacy)].

### LLM Providers (User’s Choice – BYOK)
- Providers: Anthropic Claude API, OpenAI API, Google Generative AI API.
- **Data shared:** CAD model context (screenshots, geometry, entity data), user prompts, session history.
- **Purpose:** AI inference to generate CAD operations.
- **Authentication:** Sent using user-provided API keys (not managed by CADAgent). Users should review each provider’s privacy policy.

### No Other Third Parties
- No advertising networks, analytics providers, data brokers, or affiliate companies (including parent/subsidiary entities).

## 7. Data Storage Locations
- **Local (user machine):**
  - `~/.cadagent/session.json` — authentication tokens (permissions `0600`, owner-only).
  - `~/.cadagent/api_keys.json` — LLM API keys (permissions `0600`, owner-only, never synced to servers).
- **Server storage (our infrastructure):**
  - `backend/runs/` — session logs with hierarchical structure (retained indefinitely).
  - `backend/cadagent.log` — server activity logs (rotating, max 50MB total).
  - Supabase database — user profiles and authentication data.
- **Temporary storage:** Viewport screenshots captured as temporary files during request processing and deleted immediately after encoding.

## 8. Data Retention and Deletion Policies
- **Authentication tokens (local):** Refreshed on use; deleted when the user signs out or removes `~/.cadagent/session.json`.
- **API keys (local):** Retained until the user deletes `~/.cadagent/api_keys.json`.
- **Session logs (server):** Retained indefinitely for debugging and service improvement; deletable on user request.
- **Server logs:** Rotated automatically; maximum ~50MB retained (approximately 30–60 days depending on activity).
- **WebSocket session data:** Cleared on disconnect; conversation history limited to 200 messages per session (sliding window).
- **User account data:** Retained while the account is active; deleted upon account deletion request.
- **Deletion options:** Users may request account deletion and session log deletion via [specify email/process]. Session log deletion is processed within 30 days of verification. Local data can be removed by deleting the `~/.cadagent/` directory.

## 9. User Rights (GDPR/CCPA)
- **Right to access:** Request a copy of session logs and account data by emailing [your email].
- **Right to correction:** Update your email via the authentication portal/process.
- **Right to deletion:** Request account and data deletion by emailing [your email]; processed within [X days].
- **Right to data portability:** Session logs can be provided in JSON upon request.
- **Right to withdraw consent:** Sign out and delete local credentials at any time.
- **Right to object:** Decline to use the service or request cessation of logging where feasible.
- **Right to lodge complaint:** File with the relevant data protection authority for your jurisdiction.

## 10. Data Security Measures
- Local credential files use restrictive permissions (`0600`, owner-only).
- JWT authentication validated against the Supabase JWKS endpoint.
- BYOK architecture ensures API keys never transit or reside on CADAgent servers.
- Per-session isolation: each Fusion document uses a separate WebSocket session with isolated conversation history.
- Rate limiting enforced per user; connection limit of 200 concurrent WebSocket connections.
- TLS encryption for all network communication over HTTPS/WSS.
- Disk space monitoring: backend checks for at least 100MB free before logging to prevent resource exhaustion.

## 11. Age Restrictions
CADAgent is not directed to individuals under 18 years of age. If you are under 18, please do not use this service or provide any personal information.

## 12. Policy Updates
We may modify this Privacy Policy at any time. Changes will be posted at [https://cadagentpro.com/privacy] and users will be notified via [email and/or in-app notification]. Continued use after changes become effective constitutes acceptance of the updated policy.
