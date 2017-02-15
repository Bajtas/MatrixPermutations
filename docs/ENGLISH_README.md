MatrixPermutations 1.0
==================
Stable version released on: 02-02-2014

(C) Copyright 2016 Bartłomiej Żuber <bajtas@gmail.com>

Apllication, which documentation you are reading right now, has been designed to generating special permutations of rectangle matrixes.
Special permutations, means that this permutations have only one higher than 0 number in row and column. 
<br>I'am aware that this nothing has said to you. ;)<br>
Here is better expample:
<br><b>Input matrix:</b><br>

[ 5 3 4 ]<br>
[ 1 2 3 ]<br>
[ 4 2 1 ]<br>

<b>And 3 of 9 output permutations of that matrix:</b><br>
	[ 5 0 0 ]			[ 0 3 0 ]		[ 0 0 4 ]<br>
	[ 0 2 0 ]			[ 1 0 0 ]		[ 1 0 0 ]<br>
	[ 0 0 1 ]			[ 0 0 1 ]		[ 0 2 0 ]<br>
	
etc..<br>
	
	Permutations like this for matrix NxN(rectangle) are N!

Due to the rapidly increasing complexity, this application can generate permutations for maximum matrix size of 10x10.

# Manual:
After click "losuj" button, random size matrix(with random values) will be generated.
In case that you want read matrix from disk, file needs to have extension '*.txt', 
if matrix in choosen file will be not corret, application will info user about empty spaces in matrix.
If user decide to click 'kontynuuj' button on dialog with empty spaces info, matrix will be loaded, and every empty space will be filled with random value.

Warning, for permutations with size 10x10, you need about 4 GB spaces on HDD.

*Version log:*
* 1.0(wersja stabilna) - Latest fixes for permutation algorithm and memmory allocation.
* 0.98 - Added info about author.
* 0.95 - Minor fixes for loading data algorithm.
* 0.92 - Fixes related to memory allocation.
* 0.90 - Minor fixes.
* 0.87 - Fixes related to memory allocation.
* 0.83b - GUI fixes for data input.
* 0.83a - Making GUI for data input layer.
* 0.81 - Added data loading algorithm.
* 0.72 - Changes window size of application.
* 0.71a - Added random algorithm for matrixes.
* 0.71 - Minor fixes.
* 0.68 - Last changes for permutations algorithm.
* 0.55 - Memmory management has been improvement.
* 0.48 - Changes in permutations algorithm.
* 0.38 - Prepering algorithm for permutations.
* 0.33 - Default background added.
* 0.32 - Changes and fixes in GUI.
* 0.29 - Added functionality to change colors and functionality to load custom background.
* 0.28 - Minor fixes.
* 0.25 - Change visualization of data saved in file.
* 0.20 - Some fixes in GUI.
* 0.12 - Button "zapisz na dysku" to save file on HDD has been added.
* 0.07 - Some fixes for load matrixes algorithm.
* 0.03 - Algorithm to load matrixes from files '*.txt' added.
* 0.01 - Simple GUI has been created.
