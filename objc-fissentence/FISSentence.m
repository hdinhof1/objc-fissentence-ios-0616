//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Henry Dinhofer on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

-(void)assembleSentence
{
    NSString *fullSentence  = [self.words componentsJoinedByString:@" "]; //helpful method
    
    /*for (NSUInteger i = 0; i< [self.words count]; i++)
     {
        if ( i + 1 == [self.words count]) 
        {
             fullSentence = [fullSentence stringByAppendingString:self.words[i]];
         }
         fullSentence = [fullSentence stringByAppendingString:[NSString stringWithFormat:@"%@ ", self.words[i]]];
     }
   */
    
    fullSentence = [fullSentence stringByAppendingString:self.punctuation];
    self.sentence = fullSentence;
}
-(BOOL)validWord:(NSString *)word
{
    BOOL isValid = NO;
    if (![word isEqualToString:nil]  &&
        !([word length] == 0)        &&
        ![word isEqualToString:@" "]
        )
    {
        isValid = YES;
    }
        
   
    return isValid;
}
-(BOOL)validPunctuation:(NSString *)punctuation
{
    NSArray *lettersWeDoWant = @[@".", @"?", @"!",@",",@";",@":",@"-"];
    BOOL isValidPunctuation = NO;
    for (NSString *letter in lettersWeDoWant)
    {
        if ([punctuation isEqualToString:letter]){
            isValidPunctuation = YES;
        }
    }
    
    return isValidPunctuation;
}
-(BOOL)validIndex:(NSUInteger) index
{
    BOOL isValidIndex = NO;
    
    if (index < self.words.count)
    {
        isValidIndex = YES;
    }
    return isValidIndex;
}



-(void)addWord:(NSString *)word{
    
    if ([self validWord:word])
    {
            [self.words addObject:word];
    }

    [self assembleSentence];
    
}
-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation
{

    if ([self validPunctuation:punctuation])
    {
            self.punctuation = punctuation;
        if ([words count] == 0 ||
            words == nil)
        {
            return;
        }else {
            for (NSString *wordToAdd in words)
            {
                [self addWord:wordToAdd];
            }
        }
    }
}
-(void)removeWordAtIndex:(NSUInteger)index
{
    if ([self validIndex:index])
    {
        [self.words removeObjectAtIndex:index];
        [self assembleSentence];
    }
}
-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index
{
    if ([self validWord:word] && [self validIndex:index])
    {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];

}
-(void)replacePunctuationWithPunctuation:(NSString *)punctuation
{
    if ([self validPunctuation:punctuation])
    {
        self.punctuation = punctuation;
    }
    [self assembleSentence];

}
-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word
{
    if ([self validWord:word] && [self validIndex:index])
    {
        [self.words replaceObjectAtIndex:index withObject:word];
        [self assembleSentence];
    }
}
@end
