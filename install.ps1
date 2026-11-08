# Installe la sélection de skills Claude Code de S.O.S INFO LUDO.
# Usage : irm https://raw.githubusercontent.com/lerapeurdu62280-debug/Claude-Skills-SOSINFOLUDO/main/install.ps1 | iex
# Prérequis : Claude Code, Git, Node.js 18+ (pour npx), Python + uv (pour graphify), .NET SDK (pour csharp-lsp).

$ErrorActionPreference = 'Continue'
function Etape($t) { Write-Host "`n== $t" -ForegroundColor Cyan }
function Manque($cmd) { -not (Get-Command $cmd -ErrorAction SilentlyContinue) }

if (Manque 'claude') { Write-Host "Claude Code introuvable : installez-le d'abord (https://claude.com/claude-code)." -ForegroundColor Red; return }
if (Manque 'git')    { Write-Host "Git introuvable : installez Git for Windows d'abord." -ForegroundColor Red; return }

Etape 'Boutiques de plugins'
$boutiques = @('anthropics/claude-plugins-official', 'alirezarezvani/claude-skills', 'DietrichGebert/ponytail', 'AgentsORG/design-engineering')
foreach ($b in $boutiques) { claude plugin marketplace add $b }

Etape 'Plugins'
$plugins = @(
  'vercel@claude-plugins-official', 'csharp-lsp@claude-plugins-official', 'paypal@claude-plugins-official',
  'sumup@claude-plugins-official', 'discord@claude-plugins-official', 'security-guidance@claude-plugins-official',
  'hookify@claude-plugins-official',
  'engineering-skills@claude-code-skills', 'self-improving-agent@claude-code-skills', 'marketing-skills@claude-code-skills',
  'business-growth-skills@claude-code-skills', 'finance-skills@claude-code-skills', 'demo-video@claude-code-skills',
  'landing@claude-code-skills',
  'ponytail@ponytail', 'design-engineering@agentsorg'
)
foreach ($p in $plugins) { claude plugin install $p }

Etape 'Serveur C# pour csharp-lsp'
if (Manque 'dotnet') { Write-Host 'SDK .NET absent : csharp-lsp restera inactif.' -ForegroundColor Yellow }
elseif (Manque 'csharp-ls') { dotnet tool install -g csharp-ls }

$skills = Join-Path $HOME '.claude\skills'
New-Item -ItemType Directory -Force $skills | Out-Null

Etape 'Skills de design (npx skills)'
if (Manque 'npx') { Write-Host 'Node.js absent : hallmark et web-design-engineer ignorés.' -ForegroundColor Yellow }
else {
  npx -y skills add nutlope/hallmark -g --agent claude-code
  npx -y skills add ConardLi/garden-skills -g --agent claude-code --skill web-design-engineer
}

$tmp = Join-Path ([IO.Path]::GetTempPath()) ("skills-" + [guid]::NewGuid())
New-Item -ItemType Directory $tmp | Out-Null
try {
  Etape 'nothing-design'
  if (-not (Test-Path "$skills\nothing-design")) {
    git clone -q --depth 1 https://github.com/dominikmartn/nothing-design-skill.git "$tmp\nothing"
    Copy-Item -Recurse "$tmp\nothing\nothing-design" $skills
  } else { Write-Host 'déjà présent' }

  Etape 'Skills bitranox (4 dossiers seulement, sans le plugin ni son hook)'
  $bx = 'infra-windows-servicing', 'compuse-ssh', 'process-debug-systematic', 'docs-convert-markitdown'
  git clone -q --depth 1 --filter=blob:none --sparse https://github.com/bitranox/bitranox-skills.git "$tmp\bx"
  git -C "$tmp\bx" sparse-checkout set ($bx | ForEach-Object { "plugins/bitranox/skills/$_" })
  foreach ($s in $bx) {
    if (Test-Path "$skills\$s") { Write-Host "$s déjà présent"; continue }
    Copy-Item -Recurse "$tmp\bx\plugins\bitranox\skills\$s" $skills
    Remove-Item -Recurse -Force "$skills\$s\.skillwriter", "$skills\$s\tests" -ErrorAction SilentlyContinue
  }
} finally { Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue }

Etape 'graphify'
if (Manque 'uv') { Write-Host 'uv absent : installez-le puis lancez « uv tool install graphifyy ; graphify install ».' -ForegroundColor Yellow }
else { uv tool install graphifyy; graphify install }

Write-Host "`nTerminé. Dans Claude Code, tapez /reload-plugins (ou relancez-le)." -ForegroundColor Green
