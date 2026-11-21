# MINI CITY

San Francisco-inspirerad open world-prototyp i webbläsaren.
Version 1 är en **vertikal slice** för att verifiera spelloopet – inte det slutliga spelet.

## ⚡ En-klick-kom-igång

Spelet består av en enda `index.html` (Three.js hämtas från CDN, så internet behövs första gången).

| Plattform | Gör så här |
|---|---|
| **Windows** | Dubbelklicka på **`gor-igang-windows.bat`** – servern startar och webbläsaren öppnas automatiskt. |
| **macOS** | Kör **`./gor-igang-mac-linux.sh`** i Terminal (första gången: `chmod +x gor-igang-mac-linux.sh`). |
| **Linux** | Kör **`./gor-igang-mac-linux.sh`** i terminalen (första gången: `chmod +x gor-igang-mac-linux.sh`). |

Skripten hittar automatiskt Node.js eller Python, startar en lokal server på
`http://localhost:8080/index.html` och öppnar webbläsaren.

Manuellt alternativ:

```bash
python3 -m http.server 8080
# eller
npx serve -l 8080 .
```

## Kontroller

| Tangent | Funktion |
|---|---|
| `W A S D` | Rörelse / körning |
| `Shift` | Spring |
| `Space` | Hopp |
| `Mus` | Kamera (pointer lock – klicka i spelvyn) |
| `E` | Gå in i närmaste fordon |
| `F` | Lämna fordonet |
| `Esc` | Pausmeny |

## Vad som finns i V1

- Startmeny, inställningar (grafiknivå), pausmeny, lokalt sparande
- 3D-stad: vägnät, byggnader, hamn, bro-landmark, kullar
- Tredjepersonskaraktär: gång, spring, hopp, enkel kollision
- Bilar att köra: gas, broms, backa, styra, krockskada
- NPC:er som vandrar; påkörning → vittne larmar polisen
- Wanted-nivå (1–5), polisbilar som jagar, gripande/böter, utföranding av wanted
- HUD: pengar, hälsa, wanted-stjärnor, hastighet, position
- Minimap med spelare, fordon och polis

## Medvetet EJ implementerat i denna prototyp

- Riktig multiplayer, konton, serverlagring
- Riktiga modeller, animationer och ljud
- Avancerad fordonsfysik (Rapier) och trafiksystem
- Uppdrag, karaktärsskapare, handkontroll

Multiplayer-knappen är därför avstängd i menyn.

## Nästa steg (plan)

1. Migrera till TypeScript + Vite + modulstruktur (core/world/entities/systems/ui/net).
2. Byt egen fysik mot Rapier 3D.
3. Asset-pipeline: riktiga modeller, texturer, ljud.
4. Därefter: backend (Node/Postgres/Redis), multiplayer, drift.

## Teknisk status

- Three.js 0.160 via CDN (ES module)
- Enkel egen fysik/kollision (AABB) – placeholder, inte Rapier
- Sparande i `localStorage` (`minicity.save`, `minicity.settings`)
