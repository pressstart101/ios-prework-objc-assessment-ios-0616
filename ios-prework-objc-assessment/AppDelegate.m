//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableArray *numbersArray = [[NSMutableArray alloc]init];
    numbersArray = [[self generateArrayOfNumbers]mutableCopy];
    
    NSMutableArray *lettersArray = [[NSMutableArray alloc]init];
    lettersArray = [[self generateArrayOfLetters]mutableCopy];
    
    NSMutableDictionary *alphabetDictionary = [[NSMutableDictionary alloc]init];
    alphabetDictionary = [[self generateNumbersAndLettersDictionaryWithNumbers:numbersArray letters:lettersArray]mutableCopy];
    
    numbersArray = [[alphabetDictionary allKeys] mutableCopy];
    NSMutableArray *mutableLettersArray = [lettersArray mutableCopy];
    [mutableLettersArray removeAllObjects];
    mutableLettersArray = [[alphabetDictionary allValues]mutableCopy];
    NSLog(@"%@ \n %@", numbersArray, mutableLettersArray);
    
    NSLog(@"%@", alphabetDictionary);
    return YES;
}
-(NSArray *)generateArrayOfNumbers{
    NSMutableArray *numbers = [[NSMutableArray alloc]init];
    for(NSUInteger i = 1; i <=26; i++){
        NSNumber *result = @(i);
        [numbers addObject:result];
    }
    return numbers;
}

-(NSArray *)generateArrayOfLetters{
    NSMutableArray *letters = [[NSMutableArray alloc]init];
    for (char i = 'a'; i <= 'z'; i++) {
     NSString *result = [NSString stringWithFormat:@"%c", i];
        [letters addObject:result];
      
    }
    return letters;
}
-(NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbersArray
                                                        letters:(NSArray *)lettersArray{
    NSMutableDictionary *resultDictionary =[[NSMutableDictionary alloc]init];
    for (NSUInteger i = 0; i < [numbersArray count]; i++){
    resultDictionary[numbersArray[i]] = lettersArray[i];
    }
    return resultDictionary;
}

@end
