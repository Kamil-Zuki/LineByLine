# LineByLine: A Platform for Real Language Acquisition

> **Version 1.0** | October 2025  
> *"Language learning that respects science, not engagement metrics."*

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [The Problem: Why Traditional Apps Fail](#the-problem)
3. [Our Solution: Evidence-Based Learning](#our-solution)
4. [Core Philosophy & Learning Principles](#core-philosophy)
5. [Technical Architecture](#technical-architecture)
6. [Module Ecosystem](#module-ecosystem)
   - [Vocabulary Module](#vocabulary-module)
   - [Speaking Module](#speaking-module)
   - [Writing Module](#writing-module)
   - [Reading Module](#reading-module)
   - [Listening Module](#listening-module)
7. [Design System: Quiet Immersion](#design-system)
8. [Gamification Strategy](#gamification-strategy)
9. [AI & Personalization](#ai-personalization)
10. [Roadmap](#roadmap)
11. [Success Metrics](#success-metrics)

---

## Executive Summary

**LineByLine** is a comprehensive language learning platform built on proven acquisition methods, not dopamine loops. Unlike Duolingo's gamification-first approach, we prioritize:

- **Comprehensible Input** (Krashen's i+1 hypothesis)
- **Spaced Repetition** (FSRS algorithm for optimal retention)
- **Output Practice** (speaking & writing with immediate feedback)
- **Real-world content** (not isolated sentences)
- **Community learning** (collaborative decks, shared progress)

### Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Frontend** | Next.js (React) | Fast, SEO-friendly, PWA-ready |
| **Backend** | ASP.NET Core | Robust API, auth, data management |
| **ML/AI Engine** | Python (FastAPI + gRPC) | FSRS scheduling, speech processing |
| **Cache/Queue** | Redis | Session state, real-time features |
| **Database** | PostgreSQL | User data, decks, progress |
| **Deployment** | Docker + Compose | Consistent dev/prod environments |

### Key Differentiators

1. **Git-like deck versioning** — fork, commit, merge vocabulary sets
2. **FSRS 4.5 algorithm** — scientifically optimal review scheduling
3. **Modular skill system** — master one skill at a time
4. **Comprehensible input engine** — content adapts to your exact level
5. **Community-driven content** — subscribe to expert-curated decks

---

## The Problem: Why Traditional Apps Fail {#the-problem}

### The Duolingo Trap

| What They Do | Why It Fails | Science Says |
|-------------|--------------|--------------|
| **Gamification > Learning** | Streaks become the goal, not fluency | Extrinsic motivation fades; intrinsic motivation (understanding) lasts |
| **Isolated sentences** | "The apple is red" teaches nothing useful | Languages need context (usage-based theory) |
| **Translation exercises** | Thinking through L1 slows acquisition | Direct L2 → meaning mapping is faster (Krashen) |
| **Fixed review intervals** | Same timing for everyone | Individuals forget at different rates (Ebbinghaus curve varies) |
| **No output practice** | Passive recognition ≠ active recall | Output forces deeper processing (Swain's Output Hypothesis) |

### What Learners Actually Need

Based on research from:
- **Stephen Krashen** (Input Hypothesis)
- **Paul Nation** (Vocabulary acquisition)
- **Merrill Swain** (Output Hypothesis)
- **Robert Bjork** (Desirable Difficulties)

**Successful acquisition requires:**

1. **Massive comprehensible input** (listening/reading at i+1 level)
2. **Spaced, interleaved practice** (not massed repetition)
3. **Forced output** (speaking/writing with feedback)
4. **Emotional engagement** (stories, not sentences)
5. **Autonomous learning** (learner controls content & pace)

---

## Our Solution: Evidence-Based Learning {#our-solution}

### The LineByLine Method

```
┌─────────────────────────────────────────────────────────┐
│  INPUT (60% of time)                                    │
│  ├─ Listening: Podcasts, dialogues (with/without subs) │
│  └─ Reading: Graded texts, authentic articles          │
├─────────────────────────────────────────────────────────┤
│  VOCABULARY (25% of time)                               │
│  └─ FSRS-scheduled flashcards with context sentences   │
├─────────────────────────────────────────────────────────┤
│  OUTPUT (15% of time)                                   │
│  ├─ Speaking: Shadowing, conversation practice         │
│  └─ Writing: Sentence construction, journaling         │
└─────────────────────────────────────────────────────────┘
```

### Why This Works

1. **Input-driven** — 60% focus on listening/reading builds intuition
2. **Context-rich** — vocabulary taught in sentences, not isolation
3. **Personalized spacing** — FSRS adapts to YOUR memory
4. **Output forces consolidation** — speaking/writing reveals gaps
5. **Intrinsic motivation** — progress measured in comprehension, not XP

---

## Core Philosophy & Learning Principles {#core-philosophy}

### 1. Comprehensible Input (i+1)

**Definition:** Expose learners to content slightly above their current level.

**Implementation:**
- **Reading Module:** Texts auto-graded by known vocabulary %
  - Green: 98%+ known words (easy practice)
  - Yellow: 90-97% known (optimal learning zone)
  - Red: <90% known (frustration zone)
- **Listening Module:** AI adjusts speech rate (0.7x → 1.3x)
- **Vocabulary Module:** New words appear in familiar sentence structures

**Example:**
```
Current level: A2 (knows ~1500 words)

✅ Good input: "Yesterday, María went to the market and bought fresh vegetables."
❌ Bad input: "The photosynthetic process converts solar energy into chemical energy."
```

### 2. Spaced Repetition (FSRS Algorithm)

**Why not Anki's SM-2?**

| Algorithm | Release | Strengths | Weaknesses |
|-----------|---------|-----------|------------|
| SM-2 (Anki) | 1988 | Simple, proven | Fixed formula, no personalization |
| **FSRS 4.5** | 2023 | Machine learning, adapts per user | Requires initial calibration |

**FSRS learns:**
- How quickly YOU forget specific card types
- Your optimal review intervals (not averages)
- Which cards need more frequent review

**Implementation:**
- Python service (`@inclusive`) handles scheduling
- Redis caches due cards for instant response
- ASP.NET backend (`@personal-vocab`) logs reviews

### 3. Comprehensible Output

**Theory (Swain, 1985):** Producing language (speaking/writing) helps learners:
- Notice gaps in knowledge
- Test hypotheses about grammar
- Develop fluency (automaticity)

**Our Output Tools:**

| Tool | Skill | Method |
|------|-------|--------|
| **Shadowing** | Speaking | Repeat native audio with 0-1s delay |
| **Voice Journaling** | Speaking | 2-min daily audio diary (AI feedback) |
| **Sentence Mining** | Writing | Write 3 sentences using new vocabulary |
| **Conversation Simulator** | Speaking | AI partner adapts to your level |

### 4. Shadowing: The Ultimate Pronunciation Tool

**What is Shadowing?**

Listen to audio (speech, podcast, dialogue) and simultaneously repeat what you hear—matching:
- Pronunciation
- Intonation
- Rhythm
- Emotion

**Cognitive Benefits:**
1. **Phonological loop training** — improves working memory
2. **Prosody acquisition** — natural speech patterns
3. **Automaticity** — reduces cognitive load over time

**Implementation:**
```
User flow:
1. Select audio (30s-2min clip)
2. Listen 1x without speaking (comprehension check)
3. Shadow 3x:
   - First: Focus on pronunciation
   - Second: Match rhythm/intonation
   - Third: Add emotion/naturalness
4. Record yourself (optional)
5. AI compares your audio to native (pronunciation score)
```

**Content Library:**
- Movie/TV dialogues (Friends, Breaking Bad, etc.)
- TED Talk snippets
- Podcast clips (news, storytelling)
- Shadowing-specific lessons (minimal music, clear speech)

### 5. Desirable Difficulties (Bjork)

**Principle:** Learning should feel challenging, not easy.

**What We Avoid:**
- ❌ Multiple choice (too easy, encourages guessing)
- ❌ Translation crutches (prevents direct L2 thinking)
- ❌ Immediate hints (robs opportunity to struggle)

**What We Embrace:**
- ✅ Production (type/speak the answer)
- ✅ Interleaved practice (mix vocab, grammar, listening)
- ✅ Delayed feedback (think before seeing answer)

---

## Technical Architecture {#technical-architecture}

### System Overview

```
┌──────────────────────────────────────────────────────────────┐
│                    FRONTEND (Next.js)                        │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐            │
│  │ Vocabulary │  │  Speaking  │  │  Reading   │            │
│  │   Module   │  │   Module   │  │   Module   │  + 2 more  │
│  └────────────┘  └────────────┘  └────────────┘            │
└────────────────────────┬─────────────────────────────────────┘
                         │ REST/WebSocket
┌────────────────────────▼─────────────────────────────────────┐
│               BACKEND (ASP.NET Core)                         │
│  • User auth (JWT)                                           │
│  • Deck management (CRUD, versioning)                        │
│  • Progress tracking (XP, streaks, badges)                   │
│  • Social features (leaderboards, friends)                   │
└────────────┬──────────────────────────┬──────────────────────┘
             │                          │
             │ gRPC                     │ Redis pub/sub
             │                          │
┌────────────▼──────────────┐  ┌───────▼──────────────────────┐
│  AI ENGINE (Python)       │  │  REDIS                       │
│  • FSRS scheduling        │  │  • Session cache             │
│  • Speech-to-text         │  │  • Real-time updates         │
│  • Text difficulty calc.  │  │  • Due card queue            │
│  • Pronunciation scoring  │  │                              │
└───────────────────────────┘  └──────────────────────────────┘
             │
             │ PostgreSQL
┌────────────▼──────────────┐
│  DATABASE                 │
│  • Users, decks, cards    │
│  • Review history (FSRS)  │
│  • Progress logs          │
└───────────────────────────┘
```

### Service Responsibilities

#### 1. Frontend (Next.js)

**Location:** `line-by-line-ui/`

**Features:**
- Server-side rendering for SEO
- PWA (offline study mode)
- Real-time updates via WebSocket
- Responsive design (mobile-first)

**Key Pages:**
```
/dashboard           → Module selector, daily goal
/vocabulary/study    → Flashcard review (FSRS)
/vocabulary/browse   → Deck marketplace
/speaking/shadow     → Shadowing practice
/reading/library     → Graded texts
/profile/stats       → Progress graphs, streaks
```

#### 2. Backend (ASP.NET Core)

**Location:** `personal-vocab/`

**Endpoints:**
```
/api/auth              → Register, login, JWT refresh
/api/decks             → CRUD, fork, commit, merge
/api/cards             → Add, edit, bulk import
/api/study             → Get due cards, submit review
/api/progress          → XP, badges, streaks
/api/social            → Friends, leaderboards
/api/content           → Texts, audio files (CDN proxy)
```

**Database Schema (Key Tables):**
```sql
Users          → id, email, xp, streak_count, settings
Decks          → id, owner_id, parent_deck_id (for forks), visibility
Cards          → id, deck_id, front, back, context_sentence
Reviews        → id, card_id, user_id, rating, fsrs_state
Subscriptions  → user_id, deck_id (following public decks)
Content        → id, type (text/audio), difficulty, language
```

#### 3. AI Engine (Python + gRPC)

**Location:** `inclusive/`

**Services:**
1. **FSRS Scheduler**
   - Calculates next review date per card
   - Updates card parameters (difficulty, stability)
   - Library: `open-spaced-repetition/py-fsrs`

2. **Speech Processing**
   - Speech-to-text (Whisper API or Azure)
   - Pronunciation scoring (phoneme comparison)
   - Voice activity detection

3. **Content Analysis**
   - Text difficulty scoring (based on frequency lists)
   - Sentence mining (extract example sentences)
   - Vocabulary extraction

**gRPC Proto Definition:**
```protobuf
service FSRSService {
  rpc ScheduleCard(CardState) returns (NextReview);
  rpc BatchSchedule(CardList) returns (ReviewSchedule);
}

service SpeechService {
  rpc TranscribeAudio(AudioData) returns (Transcript);
  rpc ScorePronunciation(PronunciationRequest) returns (Score);
}
```

---

## Module Ecosystem {#module-ecosystem}

### Navigation Structure

```
┌─────────────────────────────────────────┐
│  SIDEBAR (Persistent)                   │
│  ┌─────────────────────────────────┐   │
│  │  📚 Vocabulary                  │   │
│  │  🎤 Speaking                    │   │
│  │  ✍️  Writing                     │   │
│  │  📖 Reading                     │   │
│  │  🎧 Listening                   │   │
│  │  ────────────────────           │   │
│  │  📊 Progress                    │   │
│  │  👥 Community                   │   │
│  │  ⚙️  Settings                    │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

---

## Vocabulary Module {#vocabulary-module}

### Overview

The foundation of language learning—spaced repetition flashcards powered by FSRS.

### Features

#### 1. Deck Management

**Personal Decks:**
- Create custom decks (e.g., "Business Spanish", "Anime Vocabulary")
- Import from CSV, Anki (.apkg), or text files
- Tag cards (grammar, slang, formal, etc.)

**Public Deck Marketplace:**
- Browse community-created decks
- Preview first 10 cards before subscribing
- See creator's study stats (credibility)

**Git-like Versioning:**
```
linebyline/spanish-1000-words (master)
├─ kamil/spanish-1000-words-modified (fork)
│  └─ Added 50 regional words
│  └─ Fixed 3 translation errors
└─ maria/spanish-1000-words-business (fork)
   └─ Specialized for business contexts
```

**Actions:**
- **Fork:** Copy deck to your account
- **Commit:** Save changes with message ("Added medical terms")
- **Pull Request:** Suggest changes to original deck
- **Merge:** Original creator accepts your changes

#### 2. Study Session

**Review Flow:**
```
1. Show card front (e.g., "La manzana")
2. User recalls meaning (mental effort)
3. Flip card → see back ("The apple" + example sentence)
4. Self-rate difficulty:
   - Again (complete blank)
   - Hard (struggled to recall)
   - Good (recalled correctly)
   - Easy (instant recognition)
5. FSRS calculates next review (30m → 3d → 2w → 4mo...)
```

**Card Types:**

| Type | Front | Back | Use Case |
|------|-------|------|----------|
| **Vocab → Meaning** | L2 word | L1 definition + sentence | Recognition |
| **Meaning → Vocab** | L1 definition | L2 word (type it) | Production |
| **Audio → Text** | Audio clip | Written word | Listening |
| **Image → Vocab** | Picture | L2 word | Direct association (no L1) |
| **Cloze** | "I ____ to school" | "I **went** to school" | Grammar/usage |

**Contextual Learning:**
Every card includes:
- Example sentence (shows word in use)
- Audio pronunciation (native speaker)
- Mnemonic hints (optional, user-created)

#### 3. Advanced Features

**Sentence Mining:**
- Import sentences from reading/listening content
- Auto-generate flashcards from highlighted words
- AI suggests best context sentence

**Leech Detection:**
- Cards reviewed 8+ times without progress → flagged
- Suggests: rewrite card, add mnemonic, or suspend

**Heatmap Progress:**
```
GitHub-style contribution graph:

  M  T  W  T  F  S  S
 ██ ██ ░░ ██ ██ ██ ░░  ← Week 1
 ██ ██ ██ ██ ░░ ██ ██  ← Week 2

Dark = >20 cards reviewed
Light = 1-20 cards
Empty = 0 cards (streak broken!)
```

---

## Speaking Module {#speaking-module}

### Overview

Move from silent learner to confident speaker through progressive output practice.

### Tools

#### 1. Shadowing Studio

**Purpose:** Master pronunciation, intonation, and rhythm.

**Content Types:**
- **Dialogues:** Movie/TV scenes (2-person conversations)
- **Monologues:** TED Talks, speeches (1-person)
- **Music:** Songs with clear lyrics (karaoke mode)
- **Podcasts:** News clips, storytelling

**Interface:**
```
┌────────────────────────────────────────────┐
│  🎬 Friends S01E01 - Coffee Shop Scene     │
│  ──────────────────────────────────────────│
│                                            │
│  [====●================] 0:32 / 1:45      │
│                                            │
│  🔊 "How you doin'?"                       │
│  👂 Listen │ 🎤 Shadow │ 📊 Compare        │
│                                            │
│  Transcript (Toggle):                      │
│  Rachel: "How you doin'?"                  │
│  Joey: "How YOU doin'?"                    │
└────────────────────────────────────────────┘
```

**Shadowing Modes:**

1. **Chorus Mode:** Audio + your voice simultaneously
2. **Delay Mode:** Hear phrase → repeat 1s later
3. **Solo Mode:** Muted audio, you fill the silence

**AI Feedback:**
- Pronunciation score (0-100)
- Highlighted mispronounced phonemes
- Rhythm match (visual waveform comparison)

#### 2. Conversation Simulator

**Purpose:** Practice real dialogues without human pressure.

**How It Works:**
```
AI Persona: Maria (Spanish teacher, friendly, patient)

Maria: "Hola! ¿Cómo estás hoy?"
  ↓
[You speak your response via microphone]
  ↓
AI transcribes + analyzes your Spanish
  ↓
Maria: "¡Bien! Escuché que dijiste 'estoy cansado'. 
        ¿Trabajaste mucho hoy?"
```

**Difficulty Levels:**
- **A1:** Simple Q&A (name, hobbies, weather)
- **B1:** Roleplay (restaurant, shopping, directions)
- **C1:** Debate topics (politics, philosophy, ethics)

**Adaptive Conversation:**
- AI detects hesitation → simplifies next question
- AI detects fluency → increases complexity

#### 3. Voice Journaling

**Purpose:** Build speaking confidence through daily reflection.

**Prompt Examples:**
- "Describe your day in 2 minutes."
- "What's a childhood memory?"
- "Convince me to visit your hometown."

**AI Analysis:**
- Speech rate (words per minute)
- Filler words (um, uh, like) frequency
- Grammar errors (auto-detected)
- Vocabulary diversity (unique words used)

**Progress Graph:**
```
Speaking Fluency Over 30 Days

150 wpm ┤                            ╭─●
        │                        ╭───╯
100 wpm ┤                 ╭──●──╯
        │          ╭──●───╯
 50 wpm ┤    ●─●───╯
        └────────────────────────────
        Day 1  10  20  30
```

---

## Writing Module {#writing-module}

### Overview

Develop written fluency from sentence construction to essay composition.

### Tools

#### 1. Sentence Builder

**Purpose:** Learn grammar patterns through guided construction.

**Exercise Types:**

**Scrambled Sentences:**
```
Words: [el, manzana, comí, ayer, la]
Build: "Ayer comí la manzana."
Feedback: ✅ Perfect! (Subject-Verb-Object order)
```

**Fill-in-the-Blank:**
```
"Gestern ____ ich einen Apfel." (essen)
Answer: "Gestern aß ich einen Apfel."
Feedback: ✅ Correct past tense (Präteritum)
```

**Translation (Input → Output):**
```
L1: "I would have gone if I had known."
L2: [User types French translation]
AI: Checks grammar + suggests alternatives
```

#### 2. Composition Studio

**Purpose:** Write longer texts (paragraphs, essays) with AI feedback.

**Workflow:**
```
1. Choose topic: "Describe your ideal weekend"
2. Write freely (200-500 words)
3. Submit for analysis
4. Receive feedback:
   - Grammar errors (highlighted)
   - Vocabulary suggestions (synonyms for overused words)
   - Structure critique (intro-body-conclusion)
5. Revise + resubmit
```

**AI Feedback Example:**
```
Original: "I like very much pizza. Is delicious."

Feedback:
❌ Word order: "I like pizza very much." (adverb placement)
❌ Article missing: "It is delicious."
💡 Richer vocabulary: "I adore pizza. It's delectable."
```

#### 3. Daily Writing Challenges

**Purpose:** Build writing habit through micro-tasks.

**Examples:**
- **Monday:** Write 3 sentences using today's vocabulary
- **Wednesday:** Describe this image in 50 words (photo provided)
- **Friday:** Write a letter to your future self (100 words)

**Gamification:**
- 7-day writing streak = +500 XP
- Monthly challenge winner = Badge + featured on homepage

---

## Reading Module {#reading-module}

### Overview

Massive comprehensible input through graded texts and authentic content.

### Features

#### 1. Library (Graded Readers)

**Content Categories:**
- Short stories (5-10 min reads)
- News articles (adapted for learners)
- Book chapters (Harry Potter, classics in L2)
- Blog posts (travel, tech, lifestyle)

**Difficulty Grading:**
```
AI analyzes text:
- Known vocabulary % (based on your vocab cards)
- Sentence complexity (clauses per sentence)
- Grammar structures (tenses, subjunctive, etc.)

Result:
🟢 Comfortable (98%+ known words)
🟡 Learning Zone (90-97% known)
🔴 Challenging (<90% known)
```

**Reading Interface:**
```
┌─────────────────────────────────────────────┐
│  📖 El Principito - Capítulo 1              │
│  Level: B1 | 📊 92% known words             │
├─────────────────────────────────────────────┤
│                                             │
│  Cuando yo tenía seis años vi una vez una  │
│  magnífica [lámina] en un libro...         │
│         ▲                                   │
│         └─ Click word → see definition     │
│            + Add to deck (one tap)          │
│                                             │
│  [Previous] [Bookmark] [Next]               │
└─────────────────────────────────────────────┘
```

**Interactive Features:**
- **Click-to-define:** Hover any word → instant translation
- **Add to deck:** Save unknown words → auto-creates flashcard
- **Text-to-speech:** Hear entire text (adjustable speed)
- **Progress tracking:** Bookmarks, reading time, words learned

#### 2. Sentence Mining Tool

**Purpose:** Extract vocabulary from authentic content YOU care about.

**Workflow:**
```
1. Paste text (article, lyrics, book passage)
2. AI highlights words not in your deck
3. Select words to learn
4. AI generates flashcards with:
   - Word + definition
   - Original sentence (context)
   - Audio pronunciation
5. Cards added to deck "Mined from [Source Name]"
```

**Example:**
```
Input text: "Le chat noir dormait sur le canapé."

Unknown words: canapé

Generated card:
Front: "canapé"
Back: "sofa / couch"
Context: "Le chat noir dormait sur le canapé."
Audio: [🔊 native speaker]
```

#### 3. Parallel Texts

**Purpose:** Read L2 text with optional L1 translation side-by-side.

**Interface:**
```
┌──────────────────┬──────────────────┐
│  Spanish (L2)    │  English (L1)    │
├──────────────────┼──────────────────┤
│  Era una noche   │  It was a dark   │
│  oscura y        │  and stormy      │
│  tormentosa.     │  night.          │
│                  │                  │
│  [Hidden by default →               │
│   Click to reveal if stuck]         │
└──────────────────┴──────────────────┘
```

**Best Practice:**
- Read L2 paragraph first (comprehension test)
- Only check L1 if completely lost
- Goal: Wean off L1 over time

---

## Listening Module {#listening-module}

### Overview

Train your ear through progressive listening challenges—from scripted dialogues to authentic podcasts.

### Tools

#### 1. Dialogue Practice

**Purpose:** Master conversational listening.

**Content:**
- Coffee shop orders
- Doctor appointments
- Job interviews
- Casual friend chats

**Exercise Flow:**
```
1. Listen to 30s dialogue (no text)
2. Answer comprehension questions:
   - "What did Maria order?"
   - "Why is Carlos late?"
3. Listen again with transcript
4. Repeat until 80%+ comprehension
```

**Difficulty Adjustments:**
- Speed: 0.7x (beginner) → 1.0x (intermediate) → 1.3x (advanced)
- Accent: Standard → regional dialects
- Background noise: Clean audio → café ambiance

#### 2. Podcast Library

**Purpose:** Consume authentic content for advanced learners.

**Categories:**
- **Learner Podcasts:** Slow speech, clear enunciation (Coffee Break Spanish, etc.)
- **Native Content:** True crime, comedy, news (real-world listening)

**Features:**
- Transcript toggle (on/off)
- Adjustable playback speed
- Bookmarking (save position + timestamp note)
- Vocabulary extraction (mine words from episodes)

**Recommended Strategy:**
```
Beginner (A1-A2):
  └─ Learner podcasts only (100% comprehension goal)

Intermediate (B1-B2):
  └─ 70% learner, 30% native content (focus on gist)

Advanced (C1-C2):
  └─ 100% native content (full comprehension + idioms)
```

#### 3. Dictation Exercises

**Purpose:** Test listening precision.

**How It Works:**
```
1. Hear sentence: "Je voudrais un café, s'il vous plaît."
2. Type what you heard (no replay)
3. Submit
4. AI compares:
   ✅ Correct: 100%
   ⚠️  Minor typo: "Je voudrais un cafe" (95%, missing accent)
   ❌ Significant error: "Je voodray un café" (60%)
5. Replay + see correct text
```

**Difficulty Levels:**
- **L1:** Single sentences (8-12 words)
- **L2:** Short paragraphs (50 words)
- **L3:** News clips (200 words, normal speed)

---

## Design System: Quiet Immersion {#design-system}

### Philosophy

> **"Learning should feel like breathing — effortless, private, and deeply satisfying."**

**Goals:**
1. **Zero eye strain** → Dark mode default, low blue light
2. **Zero distraction** → Single-focus layouts, no clutter
3. **Zero friction** → Keyboard shortcuts, instant load times
4. **Maximum immersion** → Floating cards, spatial depth

---

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Background** | Void Black | `#0a0a0a` | Main canvas |
| **Card Base** | Deep Indigo Glass | `rgba(30, 27, 75, 0.6)` | Content containers |
| **Text (Primary)** | Frost White | `#f8fafc` | Body text |
| **Text (Secondary)** | Slate Gray | `#94a3b8` | Labels, metadata |
| **Accent (Success)** | Soft Cyan | `#67e8f9` | Correct answers, progress |
| **Accent (Warm)** | Muted Amber | `#fbbf24` | XP, achievements |
| **Accent (Error)** | Soft Coral | `#fb7185` | Wrong answers (not harsh red) |
| **Borders** | Dark Slate | `#1e293b` | Subtle dividers |

**Glassmorphism Effect:**
```css
.card {
  background: rgba(30, 27, 75, 0.6);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
}
```

---

### Typography

**Font Stack:**
```css
body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  font-size: 16px;
  line-height: 1.6;
  font-weight: 400;
}

h1, h2, h3 {
  font-family: 'Clash Display', 'SF Pro Rounded', sans-serif;
  font-weight: 600;
}
```

**Scale:**
- **Body:** 16px (mobile), 18px (desktop)
- **Small:** 14px (labels, metadata)
- **H3:** 20px (card titles)
- **H2:** 28px (page headers)
- **H1:** 36px (hero text)

**Multilingual Support:**
- **Arabic:** Line-height 1.8 (taller for diacritics)
- **CJK:** Use Noto Sans CJK (Chinese/Japanese/Korean)
- **RTL languages:** Auto-flip layout with `dir="rtl"`

---

### Layout System

**Grid:**
```css
.container {
  max-width: 480px;        /* Mobile-first */
  margin: 0 auto;
  padding: 1.5rem;
}

@media (min-width: 768px) {
  .container {
    max-width: 720px;      /* Tablet */
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1080px;     /* Desktop: Side-by-side modules */
  }
}
```

**Card Anatomy:**
```css
.card {
  border-radius: 20px;
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  transition: transform 0.2s ease;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 48px rgba(0, 0, 0, 0.6);
}
```

**Spacing Scale:**
```
0.25rem → 4px   (tight elements)
0.5rem  → 8px   (form fields)
1rem    → 16px  (related items)
1.5rem  → 24px  (cards, sections)
3rem    → 48px  (major sections)
```

---

### UI Components

#### 1. Flashcard (Vocabulary Module)

```tsx
<div className="flashcard">
  <div className="flashcard-front">
    <h2>La manzana</h2>
    <button className="audio-btn">🔊</button>
  </div>
  
  <div className="flashcard-back">
    <p className="definition">The apple</p>
    <p className="context">"Comí una manzana ayer."</p>
    
    <div className="rating-buttons">
      <button className="rating rating-again">Again</button>
      <button className="rating rating-hard">Hard</button>
      <button className="rating rating-good">Good</button>
      <button className="rating rating-easy">Easy</button>
    </div>
  </div>
</div>
```

**Visual:**
```
┌─────────────────────────────────┐
│                                 │
│        La manzana  🔊           │
│                                 │
└─────────────────────────────────┘
             ⬇️  (flip animation)
┌─────────────────────────────────┐
│  The apple                      │
│  "Comí una manzana ayer."       │
│                                 │
│  [Again] [Hard] [Good] [Easy]   │
└─────────────────────────────────┘
```

#### 2. Progress Vine (Persistent UI Element)

**Concept:** A growing vine (SVG) on the left sidebar that visualizes long-term progress.

```svg
<svg id="progress-vine" width="60" height="100%">
  <path 
    d="M30,0 Q40,100 30,200 Q20,300 30,400"
    stroke="#67e8f9"
    stroke-width="3"
    fill="none"
    stroke-dasharray="1000"
    stroke-dashoffset="800"
    <!-- Animates as user progresses -->
  />
  
  <!-- Leaves = milestones (10 cards, 50 cards, 100 cards) -->
  <circle cx="30" cy="100" r="8" fill="#10b981" />
  <circle cx="30" cy="200" r="8" fill="#fbbf24" />
</svg>
```

**Growth Logic:**
- Vine height = Total XP / 100
- Leaf appears every 1000 XP
- Vine color shifts: Cyan (beginner) → Emerald (intermediate) → Gold (advanced)

#### 3. AI Avatar (Bottom-Right Corner)

**Purpose:** Subtle companion that reacts to user actions.

**Appearance:**
- 2.5D stylized face (SVG-based)
- Minimal features (eyes, smile)
- Soft glow around avatar

**Reactions:**
| Event | Avatar Response |
|-------|----------------|
| Correct answer | Eyes close briefly (contentment), smile widens |
| Wrong answer | Head tilts (empathy), no judgment |
| Streak milestone | Subtle sparkle animation |
| Session complete | Gentle nod, eyes glow cyan |

**Implementation:**
```tsx
<div className="ai-avatar">
  <svg viewBox="0 0 100 100">
    <!-- Eyes (animate based on state) -->
    <circle cx="35" cy="40" r="8" fill="#67e8f9" className="eye-left" />
    <circle cx="65" cy="40" r="8" fill="#67e8f9" className="eye-right" />
    
    <!-- Smile (path morphs) -->
    <path 
      d="M30,60 Q50,70 70,60" 
      stroke="#f8fafc" 
      stroke-width="3"
      fill="none"
      className="smile"
    />
  </svg>
</div>
```

#### 4. Daily Goal Widget

```
┌─────────────────────────────────────┐
│  Today's Goal: 20 cards             │
│                                     │
│  ████████████░░░░░░  60% (12/20)    │
│                                     │
│  🔥 3-day streak                    │
└─────────────────────────────────────┘
```

---

### Micro-Interactions

**1. Card Flip Animation:**
```css
.flashcard {
  transition: transform 0.6s;
  transform-style: preserve-3d;
}

.flashcard.flipped {
  transform: rotateY(180deg);
}
```

**2. Correct Answer Pulse:**
```css
@keyframes success-pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); box-shadow: 0 0 20px #67e8f9; }
  100% { transform: scale(1); }
}

.card.correct {
  animation: success-pulse 0.3s ease;
}
```

**3. Haptic Feedback (Mobile):**
```js
// On correct answer
navigator.vibrate(30);  // Short tick

// On wrong answer
navigator.vibrate([50, 100, 50]);  // Double tap

// On milestone
navigator.vibrate([100, 50, 100, 50, 200]);  // Celebration pattern
```

**4. Spatial Audio:**
```js
const audio = {
  correct: new Audio('/sounds/chime-soft.mp3'),    // 440Hz, 0.2s
  incorrect: new Audio('/sounds/thud-soft.mp3'),   // 220Hz, 0.3s
  milestone: new Audio('/sounds/bell-warm.mp3'),   // Harmonious chord
};

audio.correct.volume = 0.3;  // Subtle, not jarring
```

---

### Accessibility

**WCAG AAA Compliance:**
- **Color contrast:** 4.5:1 minimum (body text)
- **Focus indicators:** 3px cyan outline on interactive elements
- **Keyboard navigation:** Tab through all actions
- **Screen reader:** ARIA labels on all icons/buttons

**Reduce Motion:**
```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

**Font Scaling:**
- Respect user's OS font size setting
- Allow in-app text size adjustment (Settings)

---

### Performance Targets

| Metric | Target | Why |
|--------|--------|-----|
| **First Contentful Paint** | < 1.2s | User sees content fast |
| **Largest Contentful Paint** | < 2.5s | Main content loaded |
| **Time to Interactive** | < 3.0s | User can act quickly |
| **JavaScript Bundle** | < 150KB | Fast on 3G networks |
| **Image Optimization** | WebP, lazy load | Reduce bandwidth |

**Optimization Strategies:**
- Code splitting per module (load Vocabulary separate from Speaking)
- Service worker for offline caching
- CDN for audio/image assets
- Database query caching (Redis)

---

## Gamification Strategy {#gamification-strategy}

### Philosophy

> **"Gamification should reward learning, not just logging in."**

**What We Avoid:**
- ❌ Daily login bonuses (encourages empty sessions)
- ❌ Pay-to-skip mechanics (undermines learning)
- ❌ Public shaming (leaderboards showing "worst" performers)

**What We Embrace:**
- ✅ Mastery-based XP (more XP for difficult cards)
- ✅ Intrinsic rewards (seeing your vine grow)
- ✅ Collaborative goals (study with friends)

---

### XP System

**XP Sources:**

| Action | XP Earned | Rationale |
|--------|-----------|-----------|
| Review card (Good) | 10 XP | Base reward |
| Review card (Hard) | 15 XP | More effort = more reward |
| Review card (Easy) | 5 XP | Too easy = less learning |
| Complete 20-card session | 50 XP | Consistency bonus |
| 7-day streak maintained | 200 XP | Building habit |
| Shadowing exercise (>80% score) | 30 XP | Output practice |
| Write 100-word composition | 40 XP | Deep engagement |
| Read article (5+ min) | 25 XP | Input practice |
| Create public deck (>10 subscribers) | 500 XP | Community contribution |

**XP Decay Prevention:**
- No XP loss for missing days (no punishment)
- Bonus XP for returning after 3+ day break (encouragement)

**Level System:**
```
Level 1:      0 -   500 XP  (Seedling 🌱)
Level 2:    500 - 1,500 XP  (Sprout 🌿)
Level 5:  5,000 - 10,000 XP (Tree 🌳)
Level 10: 25,000 - 50,000 XP (Forest 🌲)
```

---

### Streaks

**Definition:** Consecutive days with at least 1 completed study session.

**Visualization:**
```
🔥 14-day streak

Week 1: ✅✅✅✅✅✅✅
Week 2: ✅✅✅✅✅✅✅
Today:  ← 2 hours left to maintain streak!
```

**Streak Freezes:**
- Earn 1 freeze per 7-day streak
- Use freeze to skip 1 day without breaking streak
- Max 2 freezes stored

**Milestones:**
- 7 days: +200 XP, "Week Warrior" badge
- 30 days: +1000 XP, "Monthly Maestro" badge
- 100 days: +5000 XP, "Centurion" badge, custom avatar frame

---

### Badges

**Categories:**

**1. Consistency Badges:**
- 🌟 **First Steps:** Complete 1st study session
- 🔥 **Week Warrior:** 7-day streak
- 📅 **Monthly Maestro:** 30-day streak
- 💎 **Century Club:** 100-day streak

**2. Mastery Badges:**
- 📚 **Vocab Novice:** Review 100 cards
- 📖 **Vocab Scholar:** Review 1,000 cards
- 🎓 **Vocab Master:** Review 10,000 cards
- 🗣️ **Pronunciation Pro:** 50 shadowing exercises (>80% score)
- ✍️ **Writer's Guild:** Write 10,000 words total

**3. Social Badges:**
- 👥 **Deck Creator:** Publish 1st public deck
- ⭐ **Community Star:** Your deck reaches 100 subscribers
- 🤝 **Study Buddy:** Complete 10 co-study sessions with friends

**4. Special Badges:**
- 🌙 **Night Owl:** Study session at 2-4am
- 🌍 **Polyglot Path:** Study 3+ languages in platform
- 🏆 **Leaderboard Legend:** Top 10 in monthly XP

**Display:**
- Profile page: Showcase up to 6 favorite badges
- Badge cabinet: View all earned badges (grayed out = locked)

---

### Leaderboards

**Types:**

**1. Global Leaderboard (Monthly):**
```
Rank  User           XP This Month
─────────────────────────────────
  1   🥇 Sarah        15,240 XP
  2   🥈 Miguel       14,890 XP
  3   🥉 Yuki         13,750 XP
...
 42   You             8,120 XP
```

**2. Friends Leaderboard:**
```
Among your 12 friends:

  1   Alex           3,450 XP
  2   You            3,210 XP
  3   Jamie          2,980 XP
```

**3. Language-Specific:**
```
Top Spanish Learners (This Week):

  1   Carlos         2,100 XP
  2   You            1,850 XP
```

**Privacy:**
- Opt-out option (hide from global leaderboard)
- Only show first name + last initial (e.g., "Sarah M.")
- Friends leaderboard requires mutual follow

---

### Progress Visualization

**1. Module Progress Rings:**
```
Dashboard shows 5 rings (one per module):

   Vocabulary  Speaking  Writing  Reading  Listening
      88%        45%       23%      67%       34%
```

**2. Language Proficiency Estimate:**
```
Spanish Proficiency: B1 (Intermediate)

📊 Breakdown:
- Vocabulary: 1,842 words known (B1: 1,500-2,500)
- Grammar: 78% accuracy on B1 structures
- Listening: 85% comprehension on B1 audio
- Speaking: Estimated B1 (based on AI conversations)

🎯 Next milestone: B2 (need 658 more words)
```

**3. Time Investment Graph:**
```
Study Time This Month: 14h 32m

   Hours
    8 ┤     ╭───●
    6 ┤   ╭─╯
    4 ┤ ╭─╯
    2 ┤─╯
    0 └──────────────
      Week 1  2  3  4
```

---

## AI & Personalization {#ai-personalization}

### Learning Profile

**System tracks:**
- **Vocabulary size** (per language)
- **Grammar competency** (which structures mastered)
- **Preferred content** (topics: sports, tech, food, etc.)
- **Optimal study time** (morning person vs. night owl)
- **Review patterns** (FSRS difficulty parameters)

**Adaptive Content Recommendations:**
```
"Based on your progress, we recommend:
- 📖 Reading: 'El Alchemista' (90% known vocabulary)
- 🎧 Podcast: 'Coffee Break Spanish' Episode 42
- 📝 Writing: Practice present subjunctive (your weak area)
```

### AI Features

**1. Smart Review Ordering:**
- Mix old + new cards (not all hard cards at end)
- Interleave topics (vocabulary + grammar, not blocks)
- Priority to cards near "forgetting threshold"

**2. Difficulty Auto-Adjustment:**
- Text too easy (>98% comprehension) → suggest harder texts
- Speaking exercises too fast → auto-slow to 0.8x

**3. Personalized Study Plans:**
```
Your goal: B2 Spanish in 6 months

Weekly plan:
- Monday/Wed/Fri: 30 min vocabulary review
- Tuesday/Thursday: 20 min speaking practice
- Weekends: 40 min reading + listening
```

**4. AI Tutor (Future Feature):**
- Ask questions: "When do I use 'ser' vs. 'estar'?"
- Get explanations in your native language
- Request custom exercises for weak areas

---

## Roadmap {#roadmap}

### Phase 1: MVP (Q4 2025) ✅ In Progress

**Core Features:**
- ✅ User authentication (register, login, JWT)
- ✅ Vocabulary module (FSRS flashcards)
- ✅ Deck management (create, fork, commit)
- ✅ Basic gamification (XP, streaks, levels)
- 🚧 Speaking module (shadowing only)
- 🚧 Reading module (graded texts library)

**Tech Debt:**
- Finalize gRPC communication (Python ↔ ASP.NET)
- Docker compose for local dev environment
- CI/CD pipeline (GitHub Actions)

---

### Phase 2: Enhanced Modules (Q1 2026)

**New Features:**
- Listening module (podcast library, dictation)
- Writing module (sentence builder, composition studio)
- Speaking: Conversation simulator (AI partner)
- Social features (friends, leaderboards, profile pages)

**Design:**
- Full "Quiet Immersion" UI implementation
- AI avatar reactions
- Progress vine animation
- Mobile PWA (offline mode)

---

### Phase 3: Community & Content (Q2 2026)

**Marketplace:**
- Public deck discovery (search, filters, ratings)
- Deck versioning UI (commit history, diffs, merge)
- Creator analytics (subscriber count, review stats)

**User-Generated Content:**
- Import tool (Anki, CSV, Quizlet)
- Bulk sentence mining (paste article → auto-generate cards)
- Image/audio uploads for custom cards

**Monetization (Optional):**
- Premium tier ($5/mo):
  - Unlimited decks (free: 5 decks max)
  - Advanced stats (granular progress graphs)
  - Priority AI features (faster pronunciation scoring)
- Keep core learning free forever

---

### Phase 4: Advanced AI (Q3 2026)

**AI Tutor:**
- Chat with AI in target language (Socratic method)
- Grammar explanations on-demand
- Personalized study plan generator

**Content Intelligence:**
- Auto-generate decks from YouTube videos (extract subtitles)
- Podcast transcription + vocabulary extraction
- Adaptive text difficulty (AI rewrites texts to your level)

**Speech Tech:**
- Real-time pronunciation feedback during shadowing
- Accent training (British vs. American English)
- Emotion detection (are you confident or hesitant?)

---

### Phase 5: Mobile Apps (Q4 2026)

**Native iOS/Android:**
- Offline study mode (sync when online)
- Widgets (daily goal progress, streak counter)
- Push notifications (gentle reminders, not spam)
- Voice-first interface (study while commuting)

**Wearables:**
- Apple Watch: Quick reviews during breaks
- Smart speakers: "Alexa, quiz me on Spanish vocab"

---

## Success Metrics {#success-metrics}

### Learning Outcomes (Primary)

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Vocabulary retention** | 85%+ after 30 days | FSRS data (cards due vs. cards remembered) |
| **User-reported fluency gain** | +1 CEFR level per 6 months | Self-assessment survey |
| **Active study rate** | 60% of users study 3+ days/week | Session logs |

### Engagement (Secondary)

| Metric | Target | Measurement |
|--------|--------|-------------|
| **7-day retention** | 50% | Users who return after 1 week |
| **30-day retention** | 30% | Users still active after 1 month |
| **Average session length** | 15-20 minutes | Time from start to end of study session |
| **Daily active users (DAU)** | Grow 10% month-over-month | Login events per day |

### Community (Tertiary)

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Public decks created** | 1,000+ in Year 1 | Deck publish events |
| **Deck forks** | 20% of public decks forked | Fork action count |
| **Average deck rating** | 4.2+ / 5 stars | User ratings (after studying deck) |

### Technical (Infrastructure)

| Metric | Target | Current |
|--------|--------|---------|
| **API response time** | < 200ms (p95) | Monitor with Datadog/Grafana |
| **Uptime** | 99.5% | Exclude planned maintenance |
| **Mobile load time** | < 2s (LCP) | Lighthouse CI scores |

---

## Conclusion

**LineByLine** is not just another language app—it's a **scientifically-grounded learning ecosystem** that respects users' time, intelligence, and goals.

### What Makes Us Different

1. **Science over engagement hacks** — FSRS, comprehensible input, output practice
2. **Modular mastery** — Focus on one skill deeply, not shallow "gamified" lessons
3. **Community-driven content** — Git-like deck versioning, public marketplace
4. **Privacy-first design** — No data selling, no manipulative streaks
5. **Beautiful, calming UI** — "Quiet Immersion" design for distraction-free learning

### Our Promise

> **"We succeed when you become fluent, not when you open the app 100 days in a row."**

---

## Appendices

### A. Glossary of Language Learning Terms

| Term | Definition |
|------|------------|
| **CEFR** | Common European Framework of Reference (A1 → C2) |
| **Comprehensible Input** | Language slightly above current level (i+1) |
| **Comprehensible Output** | Producing language to test hypotheses |
| **FSRS** | Free Spaced Repetition Scheduler (ML-based algorithm) |
| **Shadowing** | Repeating audio simultaneously to improve pronunciation |
| **SRS** | Spaced Repetition System (generic term) |
| **i+1** | Input at "current level + 1 difficulty" |

### B. Recommended Reading

- **"The Natural Approach"** by Stephen Krashen
- **"How Languages Are Learned"** by Patsy Lightbown
- **"Make It Stick"** by Peter Brown (learning science)
- **"Fluent Forever"** by Gabriel Wyner (practical methods)

### C. Technical Documentation Links

- **FSRS Algorithm:** [open-spaced-repetition/fsrs4anki](https://github.com/open-spaced-repetition/fsrs4anki)
- **gRPC Protocol:** `proto/fsrs_service.proto` (internal repo)
- **API Endpoints:** `docs/api-reference.md` (internal repo)
- **Design System:** `docs/design-system.md` (internal repo)

---

**Last Updated:** October 31, 2025  
**Document Owner:** LineByLine Product Team  
**Contact:** [project repository]

---

*This is a living document. As we learn from users and iterate on features, we'll update this vision accordingly.*

