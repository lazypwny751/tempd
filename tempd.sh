#!/bin/bash

tempd.create() {
	local beforequit="print" DIGIT="5" PREFIX="tmp"

	if ! command -v "mkdir" &> /dev/null ; then
		echo "command \"mkdir\" not found, please resolve that requirement."
		exit 1
	fi

	gen.randend() {
		[[ -z "${1}" ]] && local DIGIT="5" || local DIGIT="${1}"
		local CHARSET=(
			"A"
			"B"
			"C"
			"D"
			"E"
			"F"
			"G"
			"H"
			"I"
			"J"
			"K"
			"L"
			"M"
			"N"
			"O"
			"P"
			"Q"
			"R"
			"S"
			"T"
			"U"
			"V"
			"W"
			"X"
			"Y"
			"Z"

			"a"
			"b"
			"c"
			"d"
			"e"
			"f"
			"g"
			"h"
			"i"
			"j"
			"k"
			"l"
			"m"
			"n"
			"o"
			"p"
			"q"
			"r"
			"s"
			"t"
			"u"
			"v"
			"w"
			"x"
			"y"
			"z"

			"0"
			"1"
			"2"
			"3"
			"4"
			"5"
			"6"
			"7"
			"8"
			"9"		
		)

		for _digit_ in $(eval echo {1..${DIGIT}}) ; do
			local randend+="${CHARSET[$((RANDOM % ${#CHARSET[@]}))]}"
		done

		echo "${randend}"
	}

	while (( "${#}" > 0 )) ; do
		case "${1,,}" in
			("prefix"|"p")
				shift
				if [[ -n "${1}" ]] ; then
					local PREFIX="${1}"
					shift
				fi
			;;
			("export"|"e")
				shift
				local beforequit="export"
			;;
			("digit"|"d")
				shift
				if [[ -n "${1}" ]] ; then
					local DIGIT="${1}"
					shift
				fi
			;;
			(*)
				shift
			;;
		esac
	done

	local rand="${PREFIX}.$(gen.randend "${DIGIT}")" # initial definition
	until [[ ! -d "/tmp/${rand}" ]] ; do
		local rand="${PREFIX}.$(gen.randend "${DIGIT}")" # regeneration definition
	done

	mkdir -p "/tmp/${rand}" && {
		case "${beforequit}" in
			("export")
				export TEMPD="/tmp/${rand}"
			;;
			(*)
				echo "/tmp/${rand}"
			;;
		esac
	} || {
		return 1
	}

	return 0
}

if [[ "${BASH_SOURCE[-1]}" = "${0}" ]] ; then
	tempd.create "${@}"
fi