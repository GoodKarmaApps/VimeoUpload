//
//  VideoSettings.swift
//  VIMUpload
//
//  Created by Alfred Hanssen on 10/3/15.
//  Copyright © 2015 Vimeo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

class VideoSettings
{
    var title: String?
    var desc: String?
    var privacy: String
    var users: [String]? // List of uris of users who can view this video

    init(title: String?, description: String?, privacy: String, users: [String]?)
    {
        self.title = title
        self.desc = description
        self.privacy = privacy
        self.users = users
    }
    
    // MARK: Public API
    
    func parameterDictionary() -> [String: AnyObject]
    {
        var parameters: [String: AnyObject] = [:]
        
        if let title = self.title where title.characters.count > 0
        {
            parameters["name"] = title
        }
        
        if let description = self.desc where description.characters.count > 0
        {
            parameters["description"] = description
        }
        
        if self.privacy.characters.count > 0
        {
            parameters["privacy"] = ["view": self.privacy]
        }

        return parameters
    }
    
    // MARK: NSCoding
    
    required init(coder aDecoder: NSCoder)
    {
        self.title = aDecoder.decodeObjectForKey("title") as? String
        self.desc = aDecoder.decodeObjectForKey("desc") as? String
        self.privacy = aDecoder.decodeObjectForKey("privacy") as! String
        self.users = aDecoder.decodeObjectForKey("users") as? [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.desc, forKey: "desc")
        aCoder.encodeObject(self.privacy, forKey: "privacy")
        aCoder.encodeObject(self.users, forKey: "users")
    }
}
