//
//  Generated by preggers 0.3.5.
//

#import <Foundation/Foundation.h>


@class Compiler;


@protocol PEGParserDataSource;
typedef NSObject<PEGParserDataSource> PEGParserDataSource;

typedef struct { int begin, end;  SEL action; } yythunk;

@interface PEGParser : NSObject
{
    PEGParserDataSource *_dataSource;
    NSString *_string;
    NSUInteger _index;
    NSUInteger _limit;

    int	yybegin;
    int	yyend;
    yythunk *yythunks;
    int	yythunkslen;
    int yythunkpos;

    Compiler *_compiler;
}

@property (retain) PEGParserDataSource *dataSource;
@property (retain) Compiler *compiler;

- (BOOL) parse;
- (BOOL) parseString:(NSString *)string;

@end


@protocol PEGParserDataSource

- (NSString *) nextString;

@end

