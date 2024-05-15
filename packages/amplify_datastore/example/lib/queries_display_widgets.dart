// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

part of sample_app;

Widget displayQueryButtons(bool isAmplifyConfigured, String queriesToView,
    Function updateQueriesToView) {
  var boldText =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14);
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    VerticalDivider(
      color: Colors.white,
      width: 5,
    ),
    ElevatedButton(
      onPressed: () {
        if (isAmplifyConfigured) {
          updateQueriesToView("Blog");
        }
        return null;
      },
      style: ButtonStyle(
        // TODO(Jordan-Nelson): use `WidgetStateProperty` when min flutter sdk is 3.22.0
        // ignore: deprecated_member_use
        backgroundColor: MaterialStateProperty.all(
          queriesToView == "Blog" ? Colors.white10 : Colors.white60,
        ),
      ),
      child: Text(
        'Blogs',
        style: queriesToView == "Blog" ? boldText : TextStyle(),
      ),
    ),
    divider,
    ElevatedButton(
      onPressed: () {
        if (isAmplifyConfigured) {
          updateQueriesToView("Post");
        }
        return null;
      },
      style: ButtonStyle(
        // TODO(Jordan-Nelson): use `WidgetStateProperty` when min flutter sdk is 3.22.0
        // ignore: deprecated_member_use
        backgroundColor: MaterialStateProperty.all(
          queriesToView == "Post" ? Colors.white10 : Colors.white60,
        ),
      ),
      child: Text(
        'Posts',
        style: queriesToView == "Post" ? boldText : TextStyle(),
      ),
    ),
    divider,
    ElevatedButton(
      onPressed: () {
        if (isAmplifyConfigured) {
          updateQueriesToView("Comment");
        }
        return null;
      },
      style: ButtonStyle(
        // TODO(Jordan-Nelson): use `WidgetStateProperty` when min flutter sdk is 3.22.0
        // ignore: deprecated_member_use
        backgroundColor: MaterialStateProperty.all(
          queriesToView == "Comment" ? Colors.white10 : Colors.white60,
        ),
      ),
      child: Text(
        'Comments',
        style: queriesToView == "Comment" ? boldText : TextStyle(),
      ),
    ),
  ]);
}

Widget getWidgetToDisplayBlog(List<Blog> _blogsToView, Function deleteBlog) {
  return Expanded(
    child: ListView.builder(
        itemCount: _blogsToView.length,
        padding: const EdgeInsets.all(16.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: /*1*/ (context, i) {
          return ListTile(
            title: Text(
              "Name: " + _blogsToView[i].name,
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: IconButton(
              onPressed: () {
                print("Deleting " + _blogsToView[i].name);
                deleteBlog(_blogsToView[i].id);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          );
        }),
  );
}

Widget getWidgetToDisplayPost(
    List<Post> _postsToView, Function deletePost, List<Blog> allBlogs) {
  return Expanded(
    child: ListView.builder(
        itemCount: _postsToView.length,
        padding: const EdgeInsets.all(16.0),
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemBuilder: /*1*/ (context, i) {
          return ListTile(
            title: Text(
              "Title: " +
                  _postsToView[i].title +
                  ", rating: " +
                  _postsToView[i].rating.toString() +
                  ", blog: " +
                  allBlogs
                      .firstWhere(
                        (blog) => blog.id == _postsToView[i].blog?.id,
                        orElse: () => Blog(name: "Blog not found"),
                      )
                      .name,
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: IconButton(
              onPressed: () {
                print("Deleting " + _postsToView[i].title);
                deletePost(_postsToView[i].id);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          );
        }),
  );
}

Widget getWidgetToDisplayComment(
    List<Comment> _commentsToView, Function deleteFn, List<Post> allPosts) {
  return Expanded(
    child: ListView.builder(
        itemCount: _commentsToView.length,
        padding: const EdgeInsets.all(16.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: /*1*/ (context, i) {
          return ListTile(
            title: Text(
              "Content: " +
                  _commentsToView[i].content +
                  " and post: " +
                  allPosts
                      .firstWhere(
                          (post) => post.id == _commentsToView[i].post?.id)
                      .title,
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: IconButton(
              onPressed: () {
                print("Deleting " + _commentsToView[i].content);
                deleteFn(_commentsToView[i].id);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          );
        }),
  );
}
