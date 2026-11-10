<div align="center">

# 🧰 Claude-Skills-SOSINFOLUDO

### La boîte à outils Claude Code d'un atelier de réparation informatique.

*Les skills et plugins que nous utilisons vraiment au quotidien chez S.O.S INFO LUDO, triés un par un :<br>pourquoi chacun est là, ce qu'on a écarté, et les faux dépôts à ne surtout pas installer.*

<br>

[![Installer](https://img.shields.io/badge/⚡_Installer-une_commande-3DDC84?style=for-the-badge)](#-installation)
[![Windows](https://img.shields.io/badge/Windows-10%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white)](#-installation)
[![Français](https://img.shields.io/badge/en-français-7B61FF?style=for-the-badge)](#)
[![Discord](https://img.shields.io/badge/Discord-rejoindre_l%E2%80%99atelier-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=12141B)](https://discord.gg/W5hd36CW6b)

<br>

[**Pourquoi**](#-pourquoi-cette-liste-) · [**Installation**](#-installation) · [**La sélection**](#-la-sélection) · [**Écartés**](#-ce-quon-a-écarté-et-pourquoi) · [**Dépôts pièges**](#%EF%B8%8F-dépôts-pièges-à-éviter)

</div>

<br>

---

## 💡 Pourquoi cette liste ?

Il existe des milliers de skills pour Claude Code. La plupart sont pensés pour de grandes équipes (Jira, Confluence, AWS, Kubernetes…) et ne servent à rien à un indépendant. Chaque skill installé alourdit aussi chaque session.

Notre activité : **dépannage et réparation informatique**, **logiciels Windows (WPF / .NET)** vendus en ligne, **site web** sur Vercel, **serveur Discord** et **serveur FiveM**. Cette liste ne garde que ce qui sert à ça. Chaque dépôt a été lu avant d'être retenu.

<br>

## ⚡ Installation

Dans PowerShell :

```powershell
irm https://raw.githubusercontent.com/lerapeurdu62280-debug/Claude-Skills-SOSINFOLUDO/main/install.ps1 | iex
```

Puis, dans Claude Code : `/reload-plugins`.

Le script ne fait qu'ajouter des boutiques et des skills : relisez [`install.ps1`](install.ps1) avant de le lancer, c'est une bonne habitude avec n'importe quel script trouvé en ligne. Il saute proprement ce qui manque (Node.js, SDK .NET), installe uv avec winget si besoin, et ne réinstalle pas ce qui est déjà là.

> La boutique `alirezarezvani/claude-skills` est volumineuse : son téléchargement peut prendre plusieurs minutes. Laissez-le finir. Si vous lancez le script depuis un agent IA, donnez-lui un délai d'au moins 10 minutes.

<br>

## ✅ La sélection

### 🛠️ Atelier et dépannage

| Skill | Pourquoi on l'a choisi |
|---|---|
| [`infra-windows-servicing`](https://github.com/bitranox/bitranox-skills) | Le cœur du métier : mise à jour Windows qui ne passe pas, magasin de composants abîmé, codes DISM / setup.exe (0x800F0915, 0xC1900200…), mise à niveau réparatrice, Windows.old impossible à supprimer. |
| [`compuse-ssh`](https://github.com/bitranox/bitranox-skills) | Piloter des machines à distance (serveur domotique, NAS) sans se battre avec les guillemets, les clés et les empreintes d'hôte. |
| [`docs-convert-markitdown`](https://github.com/bitranox/bitranox-skills) | Faire lire à Claude une notice, un schéma ou une fiche technique en PDF, Word ou Excel. |
| [`process-debug-systematic`](https://github.com/bitranox/bitranox-skills) | Une méthode : trouver la vraie cause avant de corriger, au lieu d'empiler les rustines. |

> Ces 4 skills sont copiés seuls, **sans** le plugin bitranox complet : son hook de mémoire automatique entrerait en conflit avec une mémoire déjà en place.

### 💻 Développement de logiciels

| Skill | Pourquoi on l'a choisi |
|---|---|
| [`csharp-lsp`](https://github.com/anthropics/claude-plugins-official) | Nos logiciels sont en C# / WPF : Claude voit les erreurs et navigue dans le code comme Visual Studio. |
| [`engineering-skills`](https://github.com/alirezarezvani/claude-skills) | Revue de code, sécurité, tests, frontend. Une partie (AWS, Azure, M365) ne nous sert pas, mais le paquet ne se découpe pas et le reste vaut le coup. |
| [`security-guidance`](https://github.com/anthropics/claude-plugins-official) | Signale les failles classiques pendant l'écriture : important pour des logiciels vendus avec licence. |
| [`ponytail`](https://github.com/DietrichGebert/ponytail) | Force la solution la plus simple qui marche. Moins de code, moins de bugs. |
| [`hookify`](https://github.com/anthropics/claude-plugins-official) | Transforme une règle (« ne jamais lancer d'appli sans accord ») en garde-fou automatique plutôt qu'en promesse. |
| [`self-improving-agent`](https://github.com/alirezarezvani/claude-skills) | Entretient la mémoire de Claude : ce qu'il faut garder, fusionner ou oublier. |
| [`graphify`](https://github.com/Graphify-Labs/graphify) | Transforme un projet en carte de connaissances : indispensable pour retrouver ce qui est câblé (ou pas) dans un gros logiciel. |
| [`find-skills`](https://github.com/vercel-labs/skills) | Quand on se demande « existe-t-il un skill pour ça ? », Claude cherche dans le catalogue skills.sh et vérifie la réputation (installations, auteur) avant de proposer quoi que ce soit. |

### 🌐 Site web et design

| Skill | Pourquoi on l'a choisi |
|---|---|
| [`vercel`](https://github.com/anthropics/claude-plugins-official) | Le site de l'atelier est hébergé sur Vercel : déploiements, journaux, variables. |
| [`design-engineering`](https://github.com/AgentsORG/design-engineering) | Les détails qui font qu'une interface « fait pro » : animations, typo, accessibilité, avec relecteurs dédiés. |
| [`hallmark`](https://github.com/Nutlope/hallmark) | Éviter le look « généré par IA » sur les pages web. |
| [`web-design-engineer`](https://github.com/ConardLi/garden-skills) | Maquettes et prototypes web soignés, vérifiés dans le navigateur. |
| [`nothing-design`](https://github.com/dominikmartn/nothing-design-skill) | Un style graphique précis (Nothing), sur demande uniquement. |
| [`landing`](https://github.com/alirezarezvani/claude-skills) | Pages de présentation en un seul fichier pour les vitrines de logiciels. |
| [`demo-video`](https://github.com/alirezarezvani/claude-skills) | Vidéos de démonstration à partir de captures d'écran. |
| [`boraoztunc/skills`](https://github.com/boraoztunc/skills) | 71 skills réunis : finitions d'interface (`impeccable`, `better-ui`, typo, couleurs, accessibilité), rédaction (`copywriting`, `stop-slop`), SEO, et vidéos en HTML (`hyperframes`, GSAP, Three.js). |

### 💶 Vente et commerce

| Skill | Pourquoi on l'a choisi |
|---|---|
| [`paypal`](https://github.com/anthropics/claude-plugins-official) | Nos logiciels se paient par PayPal : intégration du paiement et des licences. |
| [`sumup`](https://github.com/anthropics/claude-plugins-official) | Paiement en ligne et terminal SumUp, déjà utilisé sur un site e-commerce. |
| [`marketing-skills`](https://github.com/alirezarezvani/claude-skills) | Référencement local (Google Business, Maps), posts réseaux sociaux, fiches produits. |
| [`business-growth-skills`](https://github.com/alirezarezvani/claude-skills) | Suivi clients et rédaction de devis / propositions. |
| [`finance-skills`](https://github.com/alirezarezvani/claude-skills) | Analyse de prix et de rentabilité. |

### 💬 Communauté

| Skill | Pourquoi on l'a choisi |
|---|---|
| [`discord`](https://github.com/anthropics/claude-plugins-official) | Le serveur Discord de l'atelier : échanger avec Claude depuis un salon, avec contrôle d'accès. |

<br>

## 🚫 Ce qu'on a écarté (et pourquoi)

Écarter un dépôt ne veut pas dire qu'il est mauvais : il ne correspond simplement pas à notre activité.

| Dépôt | Pourquoi non |
|---|---|
| `pm-skills` (Jira, Confluence, Scrum) | Fait pour des équipes avec tickets et sprints. Désinstallé. |
| [21StarkCom/bifrost](https://github.com/21StarkCom/bifrost) | « Terrain de jeu personnel » de son auteur, dépend de tout son écosystème d'outils. |
| [preetsuthar17/ikiform-plugin](https://github.com/preetsuthar17/ikiform-plugin) | Service de formulaires en ligne : notre site a déjà son propre serveur pour ça. |
| [mattboya/My-LLM-Skills](https://github.com/mattboya/My-LLM-Skills) | `queue` / `wave` trop lourds et coûteux ; `blender-bpy` gardé en réserve pour la 3D. |
| [wayzoo/wayzoo-skill](https://github.com/wayzoo/wayzoo-skill) | Uniquement pour Roblox. |
| [alvenstudio/seller-ai-plugin](https://github.com/alvenstudio/seller-ai-plugin) | Uniquement pour la place de marché russe Ozon. |
| [ulises-jeremias/agent-toolkit](https://github.com/ulises-jeremias/agent-toolkit) | Catalogue pour équipes (Confluence, Jira, ClickUp) : tout le reste existe déjà dans la sélection. |
| [ragnarwestad/aide](https://github.com/ragnarwestad/aide) | 4 fichiers de spécification avant chaque correction, plus un tableau de bord qui lance l'IA en automatique : trop lourd et coûteux en solo. |
| [lucmoseley/workflow-core](https://github.com/lucmoseley/workflow-core) | Configuration personnelle de son auteur, sans documentation. |
| [vstoos/vlog-film](https://github.com/vstoos/vlog-film) | Sérieux, mais réservé au montage de vlogs YouTube et très lourd (GPU NVIDIA, ~10 Go). |
| [EJRyan89/coding-agent-skills](https://github.com/EJRyan89/coding-agent-skills) | Projet propre mais orienté équipes ; son pack `dotnet` fait doublon avec `dotnet format`. |
| `fullstack-dev-skills` | Doublon d'`engineering-skills`. |

<br>

## ⚠️ Dépôts pièges à éviter

En cherchant des skills, nous sommes tombés sur de **faux dépôts** qui se servent de la mode des « skills Claude » pour diffuser des logiciels malveillants. **N'y téléchargez rien.**

| Dépôt | Ce qu'on y a trouvé |
|---|---|
| `Bagasantuso/skill-forge-claude-templates` | Aucun skill, un bouton « Download » vers un site externe, un faux commit toutes les heures. |
| `SHENG5411/grimoire-of-tools` | Exactement le même modèle : même bouton, même fausse activité. |

### Comment les reconnaître

- 🔗 **Un gros bouton « Download » qui sort de GitHub** (page `*.github.io`, lien raccourci). Un vrai skill s'installe avec `git clone`, `npx skills add` ou `/plugin install`, jamais avec un `.exe` ou un `.zip` téléchargé ailleurs.
- 📂 **Aucun fichier `SKILL.md`** dans le dépôt : juste un README et un `index.html`.
- 🎲 **Des noms de fichiers aléatoires** dans `.github/` (`YjNfhGGQSGpm.yml`, `mdqgdsRFyDwVSq`).
- 🤖 **Des commits absurdes en rafale** (« decrypt merge #428 », « notify rollback #6374 ») : un robot qui simule de l'activité pour remonter dans les recherches.
- 📣 **Un texte marketing creux** qui promet tout (« 12 langues », « support 24/7 ») sans une ligne de code pour le prouver.

En cas de doute : ne cliquez sur rien et signalez le dépôt (**Report repository**, en bas à droite de sa page GitHub).

<br>

## 📜 Crédits

Ce dépôt ne contient **aucun code des skills** : uniquement cette sélection et un script qui les installe depuis leurs dépôts d'origine. Tout le mérite revient à leurs auteurs, liés dans les tableaux ci-dessus, et chaque skill reste sous sa propre licence.

<div align="center">
<br>
<sub>Sélection tenue par <b>S.O.S INFO LUDO</b>, dépannage informatique à Boulogne-sur-Mer.</sub>
</div>
