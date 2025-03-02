use std::rc::Rc;

/// upside-down tree with a designated position (the *stack pointer*)
/// and *nodes* of type `A`.
#[derive(Clone, Debug)]
pub struct TreeStack<A> {
    parent: Option<(usize, Rc<TreeStack<A>>)>,
    value: A,
    children: Vec<Option<Rc<TreeStack<A>>>>,
}

impl<A> TreeStack<A> {
    /// Creates a new `TreeStack<A>` with root label `a`.
    pub fn new(a: A) -> Self {
        TreeStack { value: a, children: Vec::new(), parent: None }
    }

    /// Applies a function `FnMut(&A) -> B` to every node in a `TreeStack<A>`.
    pub fn map<F, B>(&self, f: &mut F) -> TreeStack<B>
        where F: FnMut(&A) -> B,
    {
        let new_value = f(&self.value);
        let new_parent = match self.parent {
            Some((i, ref p)) => Some((i, Rc::new(p.map(f)))),
            None => None,
        };
        let new_children = self.children
                               .iter()
                               .map(|o| o.clone().map(|v| Rc::new(v.map(f))))
                               .collect();
        TreeStack {
          parent: new_parent,
          value: new_value,
          children: new_children
        }
    }
}