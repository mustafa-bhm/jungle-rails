describe("Add to cart ", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Clicks on add to cart", () => {
    cy.get("button").contains("Add").click({ force: true });
    cy.get("a").contains("My Cart (1)").should("be.visible");
  });
});
