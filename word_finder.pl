% word_finder.pl

% --- Dictionary Representation ---
% The dictionary is represented as a series of facts, where each fact
% `word(Atom)` defines a valid word. For simplicity, we use a small
% inline dictionary. In a real application, this would be loaded from a file.
% All words are assumed to be lowercase.

word(apple).
word(aple). % Example: a valid word from 'apple' letters
word(pale).
word(leap).
word(plea).
word(eat).
word(tea).
word(ate).
word(net).
word(ten).
word(ant).
word(tan).
word(arc).
word(car).
word(rat).
word(art).
word(tar).
word(star).
word(rats).
word(arts).
word(tars).
word(cat).
word(act).
word(tac).
word(dog).
word(god).
word(run).
word(urn).
word(nut).
word(tun).
word(on).
word(no).
word(go).
word(a).
word(i).
word(silent).
word(enlist).
word(listen).
word(silt).
word(lens).
word(nest).
word(tin).
word(lie).
word(set).
word(tile).
word(line).
word(sent).
word(lint).
word(list).
word(isle).

% --- Core Word Finding Logic ---

% find_words(+Letters, -FoundWord)
% Finds all valid words that can be formed using a subset of the given Letters.
% Letters: A list of characters (atoms), e.g., [a,p,p,l,e].
% FoundWord: A word found in the dictionary.
find_words(Letters, FoundWord) :-
    % 1. Generate all possible subsequences of the input letters.
    subsequence(Letters, SubLetters),
    % 2. Ensure the subset is not empty (a word must have at least one letter).
    SubLetters \= [],
    % 3. Generate all permutations of the letters in the subset.
    permutation(SubLetters, PermutedLetters),
    % 4. Convert the list of characters to an atom (Prolog string).
    atom_chars(FoundWord, PermutedLetters),
    % 5. Check if the generated atom is a valid word in our dictionary.
    word(FoundWord).

% subsequence(+List, -Sub)
% Generates all possible subsequences (subsets, maintaining order) of List.
% Example: subsequence([a,b,c], [a,c]) is true.
% We use this to get subsets of letters.
subsequence([], []).
subsequence([H|T], [H|Sub]) :-
    subsequence(T, Sub).
subsequence([_|T], Sub) :-
    subsequence(T, Sub).

% permutation(+List, -Permutation)
% Generates all possible permutations of List.
% This is a standard Prolog predicate, often built-in or easily defined.
% If `permutation/2` is not built-in (e.g., in very old Prolog versions),
% you can uncomment and use the definition below.
% permutation([], []).
% permutation(List, [H|T]) :-
%     select(H, List, Rest),
%     permutation(Rest, T).

% select(?Element, ?List, ?Rest)
% Selects Element from List, with Rest being the remaining list.
% This is often built-in. If not, you can uncomment and use the definition below.
% select(X, [X|Xs], Xs).
% select(X, [Y|Ys], [Y|Zs]) :-
%     select(X, Ys, Zs).

% --- Utility Predicates ---

% solve_and_print_words(+Letters)
% Finds all words from the given letters and prints them.
solve_and_print_words(Letters) :-
    writeln(user_output, 'Searching for words from: '),
    writeln(user_output, Letters),
    writeln(user_output, '--- Found Words ---'),
    % Use `findall` to collect all solutions and then print them.
    % This avoids the need for the user to type ';' after each solution.
    findall(Word, find_words(Letters, Word), WordsList),
    (   WordsList = [] ->
        writeln(user_output, 'No words found.')
    ;
        list_to_set(WordsList, UniqueWords), % Remove duplicates (e.g., from 'apple' -> 'aple')
        sort(UniqueWords, SortedWords), % Sort alphabetically
        print_words_list(SortedWords)
    ),
    writeln(user_output, '--- Search Complete ---').

% print_words_list(+ListOfWords)
% Helper to print each word in a list on a new line.
print_words_list([]).
print_words_list([H|T]) :-
    writeln(user_output, H),
    print_words_list(T).

% writeln(+Term)
% Prints a term followed by a newline.
writeln(Term) :- write(Term), nl.

% --- Example Usage ---

% To run this word finder:
% 1. Save the code as 'word_finder.pl'.
% 2. Open a Prolog interpreter (e.g., SWI-Prolog).
% 3. Load the file: `consult('word_finder.pl').`

% Examples:
% Find all words from 'apple':
% ?- solve_and_print_words([a,p,p,l,e]).

% Find all words from 'listen' (should find 'silent', 'enlist', etc. if in dictionary):
% ?- solve_and_print_words([l,i,s,t,e,n]).

% Find all words from 'rat':
% ?- solve_and_print_words([r,a,t]).

% Find words from 'dog':
% ?- solve_and_print_words([d,o,g]).

% Note on performance:
% For larger dictionaries or longer input letter lists, the performance
% can be slow due to the exponential nature of permutations and subsequences.
% For a real-world application, optimizations like trie-based dictionaries
% or more efficient permutation generation would be necessary.
