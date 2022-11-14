import { Story, Meta } from '@storybook/angular/types-6-0';
import { moduleMetadata } from '@storybook/angular';
import { CommonModule } from '@angular/common';
import { NotificationsControlFormComponent } from './notifications-control-form.component';



export default {
  title: 'App/Notifications',
  component: NotificationsControlFormComponent,
  argTypes: {
    backgroundColor: { control: 'color' },
  },
  decorators: [
    moduleMetadata({
      imports: [CommonModule],
    }),
  ],
} as Meta;

const listNotifications = [{id:"58",recommendation:"X-ray densitometry (DXA)",notifyTime:"2022-11-11 07:47:51",patient:"Muller251"},{id:"57",recommendation:"Low dose CT (smokers)",notifyTime:"2022-11-11 07:47:50",patient:"Muller251"}]

const Template: Story<NotificationsControlFormComponent> = (args: NotificationsControlFormComponent) => ({
  props: args,
});

export const DemoEmpty = Template.bind({});
DemoEmpty.args = {
  isEmptyData: true,
};

export const DemoFull = Template.bind({});
DemoFull.args = {
  data: listNotifications,
  userName: 'AnnaIvanova',
};
