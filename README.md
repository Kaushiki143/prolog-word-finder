# Prolog Word Finder / Anagram Solver

A simple command-line tool written in Prolog to find all valid words that can be formed from a given set of letters.

### Features

* Finds all possible words (anagrams and sub-anagrams) from input letters.
* Uses a predefined dictionary (easily extensible).
* Outputs words alphabetically.

### How It Works

This solver uses Prolog's powerful backtracking and unification to generate all possible combinations and permutations of the input letters. It then checks each generated sequence against an internal dictionary to identify valid words. Key Prolog predicates like `subsequence/2` and `permutation/2` are utilized.

### Prerequisites

* [SWI-Prolog](https://www.swi-prolog.org/download/stable) interpreter installed on your system.

### Getting Started

1.  **Clone the Repository (if you haven't already):**
    ```bash
    git clone [https://github.com/Kaushiki143/prolog-word-finder.git](https://github.com/Kaushiki143/prolog-word-finder.git)
    cd prolog-word-finder
    ```
    *(If you already have the folder, just navigate to it with `cd C:\Users\Kaushiki\Documents\prolog_word_finder`)*

2.  **Launch SWI-Prolog:**
    Open your SWI-Prolog interpreter (from the Start Menu). You'll see the `?-` prompt.

3.  **Navigate to the Project Directory in Prolog (Optional but recommended):**
    ```prolog
    ?- cd('C:/Users/Kaushiki/Documents/prolog_word_finder/'). % Adjust path if necessary
    ```

4.  **Load the Program:**
    ```prolog
    ?- consult('word_finder.pl').
    ```
    You should see `true.`

5.  **Run a Query:**
    To find words from letters like `[a,p,p,l,e]`:
    ```prolog
    ?- solve_and_print_words([a,p,p,l,e]).
    ```
    To run directly from your system's command line (outside the Prolog interpreter):
    ```bash
    swipl -s word_finder.pl -g "solve_and_print_words([a,p,p,l,e]), halt."
    ```

### Extending the Dictionary

To add more words to the dictionary, simply open `word_finder.pl` in a text editor and add new `word(your_new_word).` facts to the `--- Dictionary Representation ---` section. Remember to re-consult the file in Prolog after saving changes.

### Author

Kaushiki Sonawane