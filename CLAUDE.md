# Project context for Claude Code

<!--
  Szablon startowy — uzupełnij pola w nawiasach [tak: jak tu] pod konkretny
  projekt. Ten plik czyta Claude Code przy każdym uruchomieniu w tym repo,
  więc im dokładniejszy, tym lepsze będą sugestie i edycje.
-->

## Co to za projekt

[Nazwa projektu / linii produktowej], sterowanie [np. komórka robotyczna /
linia montażowa / stacja testowa]. Docelowy sprzęt: [typ CPU B&R, np.
X20CP3585, wersja Automation Runtime].

Repozytorium zawiera projekt B&R Automation Studio w wersji [np. AS 4.12].

## Struktura repo

- `*.apj` — plik projektu Automation Studio. Otwierany wyłącznie przez samo
  środowisko AS; nie edytuj go ręcznie jako tekstu.
- `Logical/` — kod źródłowy: programy (ST/IL/FBD), biblioteki, typy danych,
  konfiguracja zmiennych globalnych. **To jest główny obszar, w którym
  Claude Code powinien pracować** — przegląd, refaktoryzacja, dokumentacja,
  wyszukiwanie logiki.
- `Physical/` — przypisanie sprzętowe (kontrolery, moduły I/O, sieci,
  konfiguracja bezpieczeństwa). W dużej części generowane/zarządzane przez
  GUI Automation Studio jako XML — edytuj tu ostrożnie, patrz sekcja niżej.
- `Binaries/`, `Temp/`, `Diagnosis/`, `Upgrades/` — w pełni generowane,
  wykluczone przez `.gitignore`, nigdy nie commitowane.

## Czego Claude Code NIE powinien robić bez wyraźnej prośby

- Nie modyfikuj plików w `Physical/` "z automatu" — zmiany w konfiguracji
  sprzętowej (przypisania I/O, sieci, sloty modułów) łatwo rozjeżdżają się
  z wewnętrznym modelem Automation Studio, jeśli edytuje się je poza IDE.
- Nie dotykaj logiki związanej z bezpieczeństwem (SafeLOGIC / SafeDESIGNER,
  funkcje SIL/PL) bez jawnej prośby i bez late przeglądu przez inżyniera
  odpowiedzialnego za bezpieczeństwo maszyny. Każda taka zmiana wymaga
  ręcznej walidacji na rzeczywistym sprzęcie / w symulacji przed wdrożeniem.
- Nie zakładaj, że zmiana skompiluje się poprawnie — Claude Code w tym
  środowisku nie ma dostępu do kompilatora Automation Studio. Każdą zmianę
  w `Logical/` trzeba zbudować i przetestować (najlepiej najpierw w
  symulacji ARsim) w samym Automation Studio przed transferem na sterownik.

## Konwencje projektu

[Uzupełnij: konwencja nazewnictwa POU/zmiennych (np. prefiksy gGlobal,
fbFunctionBlock), styl komentarzy, język komentarzy (PL/EN), używane
biblioteki własne, wymagany format commitów.]

## Typowe zadania, w których Claude Code pomaga dobrze

- Przegląd i wyjaśnianie istniejącej logiki ST/IL.
- Refaktoryzacja i porządkowanie kodu w `Logical/` (bez zmiany zachowania).
- Pisanie/aktualizacja dokumentacji projektu i komentarzy w kodzie.
- Przegląd diffów przed commitem — sprawdzenie, czy zmiana nie "wciągnęła"
  przypadkiem plików z `Binaries/`, `Temp/` itp.
- Skrypty pomocnicze wokół projektu (np. do eksportu list zmiennych, raportów).

## Repozytorium i integracja

- Host: [GitHub / GitLab / inny], repo prywatne.
- Jeśli używacie GitHub: dostępna oficjalna integracja GitHub App
  (`/install-github-app` z poziomu Claude Code) oraz GitHub Actions
  (`anthropics/claude-code-action`) do automatycznych review PR-ów i
  reagowania na wzmianki `@claude` w issues/PR.
