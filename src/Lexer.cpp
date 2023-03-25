#include "include/Lexer.h"

#include <iostream>

std::ostream & operator<<(std::ostream &os, TokenType const & type) {
    switch (type)
    {
    case TokenType::COMMENT :
        return os << "COMMENT";
    case TokenType::IDENTIFIER :
        return os << "IDENTIFIER";
    case TokenType::KEYWORD :
        return os << "KEYWORD";
    case TokenType::LITERAL :
        return os << "LITERAL";
    case TokenType::OPERATOR :
        return os << "OPERATOR";
    case TokenType::SEPARATOR :
        return os << "SEPARATOR";
    
    default:
        return os;
    }
}

std::ostream & operator<<(std::ostream &os, Token const & t) {
    return os 
        << "N: " 
        << t.pos
        << " Type: " 
        << t.type 
        << " Value:\t\"" 
        << t.value 
        << "\"";
}

std::ostream & operator<<(std::ostream &os, TokenSequence const & ts) {
    os << "{\n";
    for (size_t i = 0; i < ts.size(); i++) {
        os << "\t" << ts[i] << "\n";
    }
    return os << "}";
}

TokenSequence lex(std::string const &source) {
    //std::cout << source << "\n";

    TokenSequence res;

    for (size_t c = 0; c < source.length(); c++) {
        if(c < source.length() - 1) {
            if(source[c] == '/' && source[c + 1] == '/') {
                res.push_back({
                    c,
                    TokenType::COMMENT,
                    source.substr(c, source.find('\n', c) - c)
                });

                c = source.find('\n', c) - 1;
                if(c == std::string::npos) break;

                continue;
            }
        }

        if( source[c] == '+' ||
            source[c] == '-' ||
            source[c] == '*' ||
            source[c] == '/' ||
            source[c] == '%' ||
            source[c] == '^' ||
            source[c] == '=' ||
            source[c] == '!'
        ) {
            std::string opstr;
            opstr += source[c];
            if(source.at(c + 1) == '=') {
                opstr += source[c + 1];
            }

            res.push_back({
                c,
                TokenType::OPERATOR,
                opstr
            });

            c += opstr.length() - 1;

            continue;
        }

        if( source[c] == '{' ||
            source[c] == '}' ||
            source[c] == '[' ||
            source[c] == ']' ||
            source[c] == '(' ||
            source[c] == ')' ||
            source[c] == ':' ||
            source[c] == ';') {
            res.push_back({
                c,
                TokenType::SEPARATOR,
                std::string(1, source[c])
            });
            
            continue;
        }
    }
    
    return res;
}