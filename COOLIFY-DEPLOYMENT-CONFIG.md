# Louise Website - Coolify Deployment Configuration

**Date:** 2026-01-16 12:35 UTC
**Status:** Ready for deployment (same pattern as OACIS)

---

## Coolify Configuration

**Application Name:** louise-measai-com

**Git Repository:**
- URL: `https://github.com/hollbaum/louise-measai-com`
- Branch: `main`
- Base Directory: `/` (repo root)

**Domain:**
- Primary: `louise.measai.com`
- SSL: Let's Encrypt (automatic)

**Build Configuration:**
- Builder: Dockerfile
- Dockerfile: `./Dockerfile` (in repo root)
- Build command: (automatic via Docker)

**Port:**
- Internal: 3000 (http-server)
- External: Handled by Traefik

---

## Dockerfile Details

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install -g http-server

EXPOSE 3000

CMD ["http-server", "-p", "3000", "-c-1"]
```

Simple static site served by http-server on port 3000.

---

## Repository Structure

```
louise-measai-com/
├── Dockerfile
├── index.html (main website - 9KB, 14 sections)
├── content.json (structured content data)
├── docker-compose.yml (for local testing)
├── README.md (project overview)
├── TASKS.md (implementation tracking)
├── content-sections-1-7.md (content source)
├── content-sections-8-14.md (content source)
├── package.json (metadata)
├── test.html (testing page)
└── update-content.sh (content update script)
```

---

## Website Content

**Purpose:** MEasAI pitch website for Louise Herping (investor presentation)

**Sections (14 total):**
1. Hero/Introduction
2. The Bottleneck
3. The MEasAI Solution
4. How It Works
5. Real Results
6. Why This Matters
7. The Technology
8. Use Cases
9. Market Opportunity
10. Team & Vision
11. Investment Opportunity
12. Timeline
13. Get Involved
14. Contact

**Build time:** 35 minutes (completed 2026-01-16 09:07 UTC)
**Compression rate:** 290x-455x (vs traditional agency approach)

---

## Deployment Steps (For Codex)

Same pattern as OACIS:

1. **Open Coolify UI** → Projects
2. **Create new application:**
   - Type: Git Repository
   - Repository: `hollbaum/louise-measai-com`
   - Branch: `main`
   - Base Directory: `/`
3. **Configure domain:**
   - Domain: `louise.measai.com`
   - Enable SSL (Let's Encrypt)
4. **Build settings:**
   - Build Pack: Dockerfile
   - Port: 3000
5. **Deploy**
6. **Verify:** https://louise.measai.com

---

## DNS Status

```bash
$ dig +short louise.measai.com
136.243.148.151  # VM100 (correct)
```

DNS already pointing to VM100. Traefik will route automatically once deployed.

---

## Testing

**After deployment, verify:**
1. Site loads: https://louise.measai.com
2. All 14 sections render correctly
3. No console errors
4. Responsive design works on mobile
5. SSL certificate valid

---

## Rollback Plan

If deployment fails:
1. Check Coolify logs for build errors
2. Verify Dockerfile syntax
3. Check nginx config
4. Rollback via Coolify UI if needed

---

## Related Documentation

- Main tracking: `AI_Agents/Claude-VM100/louise-chat-import-plan.md`
- Deployment patterns: `AI_Agents/shared/memory/operational-learnings/deployment-pattern-audit-20260116.md`
- OACIS reference: `External/oacis-measai-com/` (same pattern)

---

**Ready for deployment:** YES ✅
**Blocked by:** OACIS final verification (Codex working on it)
**Next:** Configure in Coolify UI after OACIS confirmed working
