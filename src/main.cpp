#include <iostream>
#include <fstream>
#include <filesystem>
#include <vector>

#include "include/Lexer.h"

#define ERROR(m) std::cout << m << "\n"; exit(1);

namespace fs = std::filesystem;

std::string readFileToString(fs::path const & filepath) {
    if(!fs::exists(filepath)) {ERROR("The argument path does not exist")};

    std::string fileContent;

    std::ifstream fileHandle(filepath);

    if(fileHandle.is_open()) {
        std::stringstream ss;
        ss << fileHandle.rdbuf();
        fileContent = ss.str();
    }
    return fileContent;
}

// std::vector<std::string> splitByLines(std::string const & source) {
//     std::vector<std::string> res;

//     std::string mutSource = source;

//     while(mutSource.find('\n') != std::string::npos) {
//         res.push_back(mutSource.substr(0, mutSource.find('\n')));
//         mutSource.erase(0, mutSource.find('\n') + 1);
//     }

//     res.push_back(mutSource);

//     return res;
// }

int main(int argc, char ** argv) {
    if(argc < 2) {ERROR("Not enough arguments")};

    fs::path source_file = argv[1];

    auto res = lex(readFileToString(source_file));

    std::cout << res << "\n";

    return 0;
}