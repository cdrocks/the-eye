# The Eye — Personality Read (Chapter 2 plan)

## How it works

The eye shows two images side by side. For about 5 seconds it watches which one you look at, then roasts your choice and moves on. After all the pairs it gives you a personality "diagnosis".

What the camera can reliably measure for each pair:
- **Dwell:** how long you looked at the left image versus the right.
- **First glance:** which image your eyes went to first.
- **Switches:** how many times you flicked between them (indecision).

A webcam can tell left from right well, especially when your head turns a little, but it can't tell exactly which spot you're looking at. That's why each screen shows only two big images, one on the left and one on the right.

> This is entertainment, in the same spirit as a horoscope: no real psychiatrist would diagnose anyone from two pictures. The four scales are loosely based on the "Big Five" personality traits, so the readings sound believable.

## Decision: fixed personality types, with surprising commentary

**Recommendation: decide the personality types in advance.** The surprise comes from the eye's live commentary, not from random results.
- Fixed types mean the same gaze always gives the same result. You can test it, tune it, and people can compare results with friends ("I got Lone Wolf, what did you get?").
- The surprise comes from details the eye notices: *"You looked at the cat first, then pretended to like the dog. Liar."* or *"7 switches. You can't even commit to a picture."*
- **Later, optionally:** send the scores (just numbers, never camera images) to Claude so it writes a one-off roast for each player. That needs a small server to keep the API key secret, because a key can't sit inside the page. The fixed types stay as the fallback.

## The 4 scales

| Scale | Pole A | Pole B | Loosely based on |
|---|---|---|---|
| **Energy** | Social | Solitary | Extraversion |
| **Pace** | Thrill | Calm | Sensation seeking |
| **Heart** | Fighter | Peacekeeper | Low vs. high agreeableness |
| **Style** | Expressive | Minimal | Openness and self-presentation |

## The 8 types (Energy × Pace × Heart), with Style as a twist

| Type | Energy | Pace | Heart | The eye says |
|---|---|---|---|---|
| **The Main Character** | Social | Thrill | Fighter | "You walk into rooms like there's a soundtrack. There isn't." |
| **The Life of the Party** | Social | Thrill | Peacekeeper | "Everyone's friend. Nobody's emergency contact." |
| **The Protector** | Social | Calm | Fighter | "You'd fight a bear for your friends. Then make them soup." |
| **The Golden Retriever** | Social | Calm | Peacekeeper | "Pure sunshine. Exhausting, but sunshine." |
| **The Lone Wolf** | Solitary | Thrill | Fighter | "Mysterious. Or you just don't answer texts." |
| **The Wanderer** | Solitary | Thrill | Peacekeeper | "Always leaving. Never explaining. Very cinematic." |
| **The Quiet Storm** | Solitary | Calm | Fighter | "Calm on the outside. Plotting on the inside. I respect it." |
| **The Old Soul** | Solitary | Calm | Peacekeeper | "You were born forty. You like tea. It's fine." |

The Style result adds one closing line:
- **Expressive:** "…in very loud shoes."
- **Minimal:** "…in a perfectly ironed black T-shirt."
- **Too close to call:** "…in whatever was on the chair."

## The screens

Image 0 is a warm-up and isn't scored. The other 8 cover each scale twice. Left and right are randomly swapped at play time, so screen side doesn't bias the result.

| # | Left | Right | Scale it measures |
|---|---|---|---|
| 0 | Espresso | Matcha tea | *warm-up only, teaches the mechanic: "Coffee. Of course. Your blood is 40% espresso."* |
| 1 | Cute dog | Cute cat | Energy (dog = Social) |
| 2 | Bustling cityscape (painting) | Wild animal in nature (painting) | Energy (city = Social) |
| 3 | Mountain peak | Serene lake | Pace (mountain = Thrill) |
| 4 | Cliff diver mid-air | Rainy-window reading nook | Pace (diver = Thrill) |
| 5 | Act of heroism in war | Peaceful village evening | Heart (heroism = Fighter) |
| 6 | Dramatic chess endgame | Long dinner table with friends | Heart (chess = Fighter) |
| 7 | Stylishly dressed person | Smart minimalist person | Style |
| 8 | Maximalist colorful room | Minimal Japanese-style room | Style |

---

## Image prompts

### How to make them all look like one set
- Paste the **style block** at the start of every prompt. It keeps the color grade, light and grain the same while the subjects change.
- Make every image **square 1:1** (1024 × 1024), with the subject in the middle so it still reads when cropped slightly. The phone is turned sideways for this scene, so the pair sits side by side, big.
- Each pair is shown side by side on a near-black screen, so keep the edges dark with no busy borders and the subject centered.
- Generate both images of a pair in the same session so they match.
- Save them as `p0-left.jpg`, `p0-right.jpg`, `p1-left.jpg` and so on, matching the table.

### Style block (photos)
```
Editorial fine-art photograph, cinematic, shot on 35mm film (Kodak Portra 400), muted desaturated palette with deep teal shadows and warm amber highlights, soft directional light, fine film grain, gentle dark vignette, shallow depth of field, one clear centered subject, generous negative space, moody low-key tones that blend into a near-black background, square 1:1 composition, subject centered, no text, no logos, no watermark, no border.
```

### Style block (the two paintings, pair 2)
```
Contemporary fine-art oil painting with visible confident brushstrokes and palette-knife texture, same muted palette of deep teal shadows and warm amber highlights, cinematic lighting, dark moody edges that fade toward near-black, one clear focal subject, gallery quality, square 1:1 composition, subject centered, no text, no signature, no frame, no border.
```

### Pair 0 — warm-up (coffee vs tea, not scored)
**Left:**
```
[STYLE BLOCK] A small dark ceramic cup of espresso with thick golden crema, a wisp of steam rising, on a dark slate surface, coffee beans scattered softly out of focus, warm amber side light.
```
**Right:**
```
[STYLE BLOCK] A handmade ceramic bowl of bright green frothy matcha, a bamboo whisk resting beside it, a wisp of steam rising, on a dark wooden surface, soft cool side light.
```

### Pair 1 — dog vs cat (Energy)
**Left:**
```
[STYLE BLOCK] A fluffy golden retriever puppy sitting and looking straight at the camera, head slightly tilted, tongue just visible, warm rim light on its fur, dark studio background.
```
**Right:**
```
[STYLE BLOCK] A sleek grey British shorthair kitten sitting upright and looking straight at the camera with wide copper eyes, slightly unimpressed expression, warm rim light on its fur, dark studio background.
```

### Pair 2 — city vs wild (Energy, paintings)
**Left:**
```
[PAINTING STYLE BLOCK] A bustling city street at dusk seen from street level, crowds of silhouetted people, glowing shop windows and neon reflections on wet pavement, light trails from passing cars, sense of energy and noise.
```
**Right:**
```
[PAINTING STYLE BLOCK] A lone wolf standing on a snowy ridge at blue hour, mist in the valley below, a single pine beside it, vast quiet wilderness, the wolf looking calmly into the distance.
```

### Pair 3 — mountain vs lake (Pace)
**Left:**
```
[STYLE BLOCK] A sharp snow-covered mountain peak at sunrise, a tiny lone climber with a headlamp on the ridge line, wind blowing snow off the summit, dramatic scale, sense of challenge.
```
**Right:**
```
[STYLE BLOCK] A perfectly still alpine lake at dawn, mirror reflection of dark pines, soft mist floating on the water, a single small wooden rowboat tied to a short dock, total calm.
```

### Pair 4 — cliff dive vs reading nook (Pace)
**Left:**
```
[STYLE BLOCK] A cliff diver frozen mid-air in a graceful swan dive above a deep turquoise sea, dark rocky cliffs, spray far below, golden late-afternoon light, shot from the side.
```
**Right:**
```
[STYLE BLOCK] A cozy window seat on a rainy evening, raindrops streaking the glass, a knitted blanket, an open hardcover book and a steaming mug of tea, warm lamp glow inside, blue dusk outside.
```

### Pair 5 — heroism vs peace (Heart)
**Left:**
```
[STYLE BLOCK] A soldier in WWII-era uniform carrying a wounded comrade over his shoulder through drifting smoke, backlit by a distant orange glow, silhouettes only, no visible injuries or blood, heroic and emotional rather than violent.
```
**Right:**
```
[STYLE BLOCK] A peaceful European village square at golden hour, an old stone fountain, children chasing pigeons in soft focus, string lights coming on, an elderly couple on a bench, warm and quiet.
```

### Pair 6 — chess vs shared table (Heart)
**Left:**
```
[STYLE BLOCK] Dramatic close-up of a wooden chess board mid-endgame, one hand moving a black queen to deliver checkmate, the fallen white king lying on its side, single hard overhead light, intense and competitive.
```
**Right:**
```
[STYLE BLOCK] A long rustic dinner table under string lights in a garden at night, friends laughing in soft focus, shared plates of food, wine glasses, candles, warm and generous atmosphere.
```

### Pair 7 — stylish vs minimalist (Style)
**Left:**
```
[STYLE BLOCK] Full-body fashion portrait of a person in a bold statement outfit: oversized tailored jacket in rich emerald velvet, patterned silk scarf, chunky rings, sculptural sunglasses, confident pose on a dark city street at night, editorial street-style look.
```
**Right:**
```
[STYLE BLOCK] Full-body fashion portrait of a person in a sharp minimalist outfit: perfectly fitted black crewneck, tailored charcoal trousers, clean white leather sneakers, a simple steel watch, relaxed upright pose against a plain dark concrete wall, quiet luxury look.
```

### Pair 8 — maximalist vs minimal room (Style)
**Left:**
```
[STYLE BLOCK] A maximalist living room bursting with personality: jewel-toned velvet sofa, layered patterned rugs, gallery wall of mismatched framed art, plants everywhere, stacks of books, warm lamp light.
```
**Right:**
```
[STYLE BLOCK] A minimal Japanese-style room: tatami floor, one low wooden table, a single ikebana branch in a ceramic vase, paper shoji screen glowing with soft daylight, lots of empty space, serene.
```

---

## Roast lines while you look (examples)

- **First glance at one, then a long stare at the other:** "You looked at the cat first. Then pretended to like the dog. Liar."
- **More than 5 switches:** "Pick one. It's a picture, not a mortgage."
- **Nearly 50/50:** "Perfectly balanced. Perfectly boring."
- **More than 80% on one side:** "Wow. You didn't even look at the other one. Rude to the lake."
- **Looked away from both:** "Neither? You're hard to please. Noted."

## Chapter 1 story images: "Don't blink" (Mochi and Bean)

The game already includes a drawn silhouette version of the six-part story. Save images as `story-1.jpg` … `story-6.jpg` in the same folder as `index.html` and the game uses them automatically. If an image is missing, it falls back to the drawn scene.

Same rules as above: portrait 3:4, dark edges, one clear subject. Use this style block so all six look like frames from one short film:

```
Cinematic animated-film still, painterly 3D style like a high-end studio short film, soft volumetric moonlight, muted palette of deep navy, slate blue and warm amber window glow, gentle film grain, shallow depth of field, rooftops of an old European city at night, emotional and intimate, portrait orientation 3:4, no text, no watermark, no border.
```

The two cats must look the same in every frame. **Mochi:** a slender mama cat with soft silver-grey fur, a white chest and pale green eyes. **Bean:** a tiny fluffy kitten, smoky grey with oversized ears and huge amber eyes.

1. `[STYLE BLOCK] Mochi sitting proudly on a moonlit rooftop ledge, tail curled around her paws, a huge full moon behind her, chimneys and a distant city skyline, calm and regal.`
2. `[STYLE BLOCK] Bean pressed against Mochi's side on the rooftop, ears flattened, eyeing a pigeon on a nearby chimney with total terror, Mochi looking down at him fondly, warm and funny.`
3. `[STYLE BLOCK] A violent storm over the rooftops, sideways rain, a lightning flash lighting the sky, Bean small and blurred mid-run disappearing between chimneys, wet slate tiles shining.`
4. `[STYLE BLOCK] Mochi alone on a rain-soaked rooftop, fur drenched, calling out with her mouth open, searching, rain streaks catching the amber glow of a window below, lonely and desperate.`
5. `[STYLE BLOCK] Pitch-dark shadow beneath an old rusted rooftop water tank, rain dripping from its edge, and two tiny glowing amber eyes staring out from the darkness. Mostly black frame, the eyes are the focus.`
6. `[STYLE BLOCK] After the storm, Mochi curled around Bean on the rooftop under a clearing sky and bright moon, Bean staring straight at the viewer with huge unblinking amber eyes, peaceful but slightly uncanny.`

## Next scenes in the queue (after this)
1. **Steer with your gaze:** guide the fly into a trap using only your eyes.
2. **Jealous eye:** a rival eye appears, and whichever one you look at gets smug while the other sulks.
3. **Copycat face:** the eye copies your expressions, then challenges you to copy it.
