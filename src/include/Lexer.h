#pragma once

#include <vector>
#include <utility>
#include <string>

enum class TokenType {
    KEYWORD,
    IDENTIFIER,
    LITERAL,
    OPERATOR,
    SEPARATOR,
    COMMENT
};

struct Token {
    size_t pos;

    TokenType type;
    std::string value;
};

std::ostream & operator<<(std::ostream &os, TokenType const & type);
std::ostream & operator<<(std::ostream &os, Token const & t);

using TokenSequence = std::vector<Token>;

std::ostream & operator<<(std::ostream &os, TokenSequence const & ts);

TokenSequence lex(std::string const &source);