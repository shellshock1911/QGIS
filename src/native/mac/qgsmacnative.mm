/***************************************************************************
    qgsmacnative.cpp - abstracted interface to native Mac objective-c
                             -------------------
    begin                : January 2014
    copyright            : (C) 2014 by Larry Shaffer
    email                : larrys at dakotacarto dot com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "qgsmacnative.h"

#include <Cocoa/Cocoa.h>
#include <QString>

QgsMacNative::~QgsMacNative()
{
}

const char *QgsMacNative::currentAppLocalizedName()
{
  return [[[NSRunningApplication currentApplication] localizedName] UTF8String];
}

void QgsMacNative::currentAppActivateIgnoringOtherApps()
{
  [[NSRunningApplication currentApplication] activateWithOptions:
                                             ( NSApplicationActivateAllWindows | NSApplicationActivateIgnoringOtherApps )];
}

void QgsMacNative::openFileExplorerAndSelectFile( const QString &path )
{
  NSString *pathStr = [[NSString alloc] initWithUTF8String:path.toUtf8().data()];
  NSArray *fileURLs = [NSArray arrayWithObjects:[NSURL fileURLWithPath:pathStr], nil];
  [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:fileURLs];
}
