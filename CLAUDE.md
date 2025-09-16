# Claude Development Notes

## Git Push Instructions for WSL

### Prerequisites
- GitHub CLI installed: `sudo apt install gh`
- Authenticated with: `gh auth login` (choose HTTPS)

### Email Configuration (REQUIRED)
```bash
git config user.email "smashingtags@users.noreply.github.com"
git config user.name "smashingtags"
```

### Standard Push Process
```bash
# 1. Stage changes
git add .

# 2. Commit changes
git commit -m "Your commit message"

# 3. Ensure remote is HTTPS (not SSH)
git remote set-url origin https://github.com/smashingtags/homelabarr-containers.git

# 4. Push to GitHub
git push origin main
```

### If Push is Rejected (non-fast-forward)
```bash
# Option A: Pull and merge (safer)
git pull origin main
git push origin main

# Option B: Force push (use with caution)
git push origin main --force
```

### Common Issues & Fixes
- **"No such device or address"**: Remote URL is wrong, use HTTPS
- **"Host key verification failed"**: Using SSH without keys, switch to HTTPS
- **"private email address"**: Set no-reply email (see Email Configuration above)
- **"non-fast-forward"**: Pull first or force push

### Key Points
- Always use HTTPS remote URLs in WSL
- Always set no-reply email to avoid privacy errors
- GitHub CLI handles authentication automatically
- Force push overwrites remote history - use carefully