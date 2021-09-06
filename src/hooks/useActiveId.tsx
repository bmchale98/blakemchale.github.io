// https://raw.githubusercontent.com/gatsbyjs/gatsby/master/www/src/hooks/use-active-hash.js
// returns the id of the header in view now by using IntersectionObserver
import { useEffect, useState } from "react";

export const useActiveId = (
  itemIds: string[],
  rootMargin = undefined
): string => {
  const [activeId, setActiveId] = useState(``);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveId(entry.target.id);
          }
        });
      },
      { rootMargin: rootMargin || `0% 0% -80% 0%` }
    );

    itemIds.forEach((id) => {
      observer.observe(document.getElementById(id) as Element);
    });

    return () => {
      itemIds.forEach((id) => {
        const element = document.getElementById(id) as Element;
        if (typeof Element === element) 
        {
          observer.unobserve(element);
        }
      });
    };
  }, [itemIds, rootMargin]);

  return activeId;
};
