//
//  main.m
//  pegged
//
//  Created by Matt Diephouse on 1/8/09.
//  This code is in the public domain.
//
#import "EvenParser.h"

int main(int argc, const char * argv[])
{
    if (argc != 2)
        return 1;
    
    @autoreleasepool {
    
        NSError *error = nil;
        NSString *file     = [NSString stringWithUTF8String:argv[1]];
        NSString *contents = [[NSString alloc] initWithContentsOfFile: file
                                                             encoding: NSUTF8StringEncoding
                                                                error: &error];
        
        BOOL hadError = NO;
        NSUInteger line = 1;
        for (__strong NSString *string in [contents componentsSeparatedByString:@"\n"])
        {
            BOOL shouldParse = [string characterAtIndex:0] != '!';
            if (!shouldParse)
                string = [string substringFromIndex:1];
            
            EvenParser *parser = [EvenParser new];
            BOOL retval = [parser parseString:string result:NULL];
            
            if (retval != shouldParse)
            {
                NSString *output = [NSString stringWithFormat:@"%@:%lu: error: '%@' %@\n", file, line, string, shouldParse ? @"didn't parse" : @"parsed"];
                fprintf(stderr, "%s", [output UTF8String]);
                hadError = YES;
            }
            
            line++;
        }
        
        
        return hadError;
    }
}
