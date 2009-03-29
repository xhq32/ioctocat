#import "GHFeedEntryCell.h"
#import "GHFeedEntry.h"


@implementation GHFeedEntryCell

- (void)setEntry:(GHFeedEntry *)anEntry {
	GHFeedEntry *newEntry = [anEntry retain];
	[entry release];
	entry = newEntry;
	titleLabel.text = entry.title;
	// Date
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"MMMM d, yyyy - H:mm";
	dateLabel.text = [dateFormatter stringFromDate:entry.date];
	[dateFormatter release];
	// Icon
	NSString *icon = [NSString stringWithFormat:@"%@.png", entry.eventType];
	iconView.image = [UIImage imageNamed:icon];
}

#pragma mark -
#pragma mark Cleanup

- (void)dealloc {
	[entry release];
	[dateLabel release];
	[titleLabel release];
	[contentLabel release];
	[iconView release];
    [super dealloc];
}


@end
