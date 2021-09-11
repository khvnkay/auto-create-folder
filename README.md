# auto-create-folder
using powershell to create folder 


how to

macOs
- pwsh -File ./AutoFodler.ps1  ./config.csv  ../



csv format 

<!-- id	name	parent	copyFrom
0	auto-create-folder		
1	PART B	0	
2	PAT	0	
3	PATd	0	
3.1	Lkl	3	 -->
| id | name  | parent  | copyFrom |
|   0 | auto-create-folder |  |  "/home/folder1" |
| 1   | PARTB | 0 |  "/home/folder1" |
| 2   | PARTC | 0 |   "/home/folder1" |
| 3   | PARTD | 0 |   "/home/folder1" |
| 3.1   | PARTDD | 3 |   "/home/folder1" |


