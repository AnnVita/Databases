#include "stdafx.h"

using StringVector = std::vector<std::string>;

static const std::string DST_FILED_NAME = "id";
static const std::string SRC_FILED_NAME = "author";
static const std::string EXIT_CODE = "...";
static const char DELIMITER = ',';

StringVector ParseByDelimiter(const std::string & sorce, char delimiter = DELIMITER);
size_t FindPosition(const StringVector & container, const std::string & searchingString);
bool RequireSearchingItem(std::string & searchingItem, std::istream & input = std::cin, std::ostream & output = std::cout);

int main(int argc, char * argv[])
{
	try
	{
		if (argc != 2)
		{
			throw std::invalid_argument("invalid arguments count");
		}

		std::fstream input(argv[1]);

		if (!input.is_open())
		{
			throw std::domain_error("invalid file");
		}

		std::string line;

		if (!getline(input, line))
		{
			throw std::domain_error("empty file");
		}

		auto tableRow = ParseByDelimiter(line);
		StringVector results;

		size_t srcPosition = FindPosition(tableRow, SRC_FILED_NAME);
		size_t dstPosition = FindPosition(tableRow, DST_FILED_NAME);

		std::string searchingValue;

		while (RequireSearchingItem(searchingValue))
		{
			std::cout << "Record id: ";
			while (getline(input, line))
			{
				tableRow = ParseByDelimiter(line);
				if (tableRow[srcPosition] == searchingValue || tableRow[srcPosition] == "\"" + searchingValue + "\"")
				{
					results.push_back(tableRow[dstPosition]);
				}
			}
			std::copy(results.begin(), results.end(), std::ostream_iterator<std::string>(std::cout, " "));
			results.clear();
			input.clear();
			input.seekg(0, std::ios::beg);
			std::cout << std::endl;
		}		
	}
	catch (std::exception & e)
	{
		std::cout << e.what() << std::endl;
		return EXIT_FAILURE;
	}
    return EXIT_SUCCESS;
}

StringVector ParseByDelimiter(const std::string & sorce, char delimiter)
{
	std::stringstream stream(sorce);
	std::string temp;
	StringVector result;
	while (getline(stream, temp, delimiter))
	{
		result.push_back(temp);
	}
	return result;
}

size_t FindPosition(const StringVector & container, const std::string & searchingString)
{
	auto foundedIt = std::find(container.begin(), container.end(), searchingString);
	if (foundedIt == container.end())
		throw std::domain_error("bad searching titles");
	return (foundedIt - container.begin());
}

bool RequireSearchingItem(std::string & searchingItem, std::istream & input, std::ostream & output)
{
	output << "Enter username: ";
	return (getline(input, searchingItem) && searchingItem != EXIT_CODE);
}